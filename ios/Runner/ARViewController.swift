import Flutter
import UIKit
import ARKit

class ARViewController: NSObject, FlutterPlatformView, ARSCNViewDelegate {
    
    private var sceneView: ARSCNView
    private var previousPoint: SCNVector3?
    private var lineColor = UIColor.white
    private var canDraw = false
    private var showDebug = false
    
    func view() -> UIView {
        return sceneView
    }
    
    init(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?, binaryMessenger messenger: FlutterBinaryMessenger) {
        sceneView = ARSCNView(frame: frame)
        
        super.init()
        
        let channel = FlutterMethodChannel(name: "plugins.flutter.io/arkit", binaryMessenger: messenger)
        channel.setMethodCallHandler(onMethodCall)
        
        sceneView.delegate = self
        sceneView.showsStatistics = false
        let scene = SCNScene(named: "art.scnassets/world.scn")!
        sceneView.scene = scene
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    
    func onMethodCall(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        switch(methodCall.method) {
        case "arkit#debug":
            showDebug = !showDebug
            if(showDebug){
                sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
            }else{
                sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin]
            }
        case "arkit#statistics":
            sceneView.showsStatistics = !sceneView.showsStatistics
        case "arkit#draw":
            canDraw = !canDraw
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    func addNode()
    {
        let capsuleNode = SCNNode(geometry: SCNCapsule(capRadius: 0.03, height: 0.1))
        capsuleNode.position = SCNVector3(0.1, 0.1, -0.1)
        sceneView.scene.rootNode.addChildNode(capsuleNode)
    }
    
    // MARK: - ARSCNViewDelegate
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        DispatchQueue.main.async {
        }
    }
    func renderer(_ renderer: SCNSceneRenderer, willRenderScene scene: SCNScene, atTime time: TimeInterval) {
        
        guard let pointOfView = sceneView.pointOfView else { return }
        
        let mat = pointOfView.transform
        let dir = SCNVector3(-1 * mat.m31, -1 * mat.m32, -1 * mat.m33)
        let currentPosition = pointOfView.position + (dir * 0.1)
        
        if canDraw {
            if let previousPoint = previousPoint {
                let line = lineFrom(vector: previousPoint, toVector: currentPosition)
                let lineNode = SCNNode(geometry: line)
                lineNode.geometry?.firstMaterial?.diffuse.contents = lineColor
                sceneView.scene.rootNode.addChildNode(lineNode)
            }
        }
        previousPoint = currentPosition
        glLineWidth(20)
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
    func lineFrom(vector vector1: SCNVector3, toVector vector2: SCNVector3) -> SCNGeometry {
        
        let indices: [Int32] = [0, 1]
        
        let source = SCNGeometrySource(vertices: [vector1, vector2])
        let element = SCNGeometryElement(indices: indices, primitiveType: .line)
        
        return SCNGeometry(sources: [source], elements: [element])
        
    }
}
