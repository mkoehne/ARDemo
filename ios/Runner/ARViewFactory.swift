import Foundation
import UIKit
import Flutter
import ARKit

public class ARViewFactory : NSObject, FlutterPlatformViewFactory {
    public func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
        )->    FlutterPlatformView{
        return ARView(frame, viewId: viewId, args: args)
    }
}
