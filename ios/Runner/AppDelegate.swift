import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    let viewFactory = ARViewFactory()
    
    registrar(forPlugin: "Kitty").register(viewFactory, withId: "ARView")
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
