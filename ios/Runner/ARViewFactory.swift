import Flutter

class ARViewFactory: NSObject, FlutterPlatformViewFactory {
    
    var messenger: FlutterBinaryMessenger
    
    init(withMessenger messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }
    
    func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
    
    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return ARViewController(withFrame: frame, viewIdentifier: viewId, arguments: args, binaryMessenger: messenger)
    }
}
