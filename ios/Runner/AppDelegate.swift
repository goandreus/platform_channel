import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    
    let controller = window.rootViewController as! FlutterBinaryMessenger
    let channel = FlutterMethodChannel(name: "com.goandreus/native_text", binaryMessenger: controller)
    
    channel.setMethodCallHandler({
        (call:FlutterMethodCall, result:FlutterResult) -> Void in
        
        switch call.method{
        case "get":
            result("ios is here")
        case "add":
            result("ios add is here")
            
        default: result(FlutterMethodNotImplemented)
            
        }
    })
    
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
