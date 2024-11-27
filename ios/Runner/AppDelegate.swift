import UIKit
import Flutter
import flutter_local_notifications
import GoogleMaps

@UIApplicationMain
 @objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      
      if #available(iOS 10.0, *) {
        UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
      }
      
    GMSServices.provideAPIKey("AIzaSyDsk_2-kzw3hwmjw-qJLr6tX3MsYDHTrSs")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
