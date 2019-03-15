import Foundation
import UIKit
import Flutter
import ARKit

public class ARView : NSObject, FlutterPlatformView {
    let frame: CGRect
    let viewId: Int64
    
    init(_ frame: CGRect, viewId: Int64, args: Any?) {
        self.frame = frame
        self.viewId = viewId
    }
    public func view() -> UIView {
        let sceneView =  ARSCNView(frame: frame)
        let config = ARWorldTrackingConfiguration()
        
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        sceneView.session.run(config)
        
        let capsuleNode = SCNNode(geometry: SCNCapsule(capRadius: 0.03, height: 0.1))
        capsuleNode.position = SCNVector3(0.1, 0.1, -0.1)
        sceneView.scene.rootNode.addChildNode(capsuleNode)
        
        return sceneView
    }
}
