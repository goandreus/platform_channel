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
        
        let arguments = call.arguments as? [String: Any]
        
        switch call.method{
        case "get":
            let age = arguments?["age"] as! Int
            let dartText = arguments?["text"] as! String
            result("ios is here: \(dartText) \(age)")
        case "add":
            result("ios add is here")
            
        default: result(FlutterMethodNotImplemented)
            
        }
    })
    
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
