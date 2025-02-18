import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let arDrawViewFactory = ARViewFactory(withMessenger: controller)
    registrar(forPlugin: "ARKit").register(arDrawViewFactory, withId: "ARViewController")
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
