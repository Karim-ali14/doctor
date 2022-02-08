// import UIKit
// import Flutter
// import GoogleMaps
// import Braintree
//
//
// @UIApplicationMain
// @objc class AppDelegate: FlutterAppDelegate {
//   override func application(
//     _ application: UIApplication,
//     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//   ) -> Bool {
// //    FirebaseApp.configure()
//     GMSServices.provideAPIKey("AIzaSyDjgUxgzitqoYObIabR-kHs17NiBPObKMc")
//     GeneratedPluginRegistrant.register(with: self)
//
//     if #available(iOS 10.0, *) {
//       UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
//     }
//     BTAppContextSwitcher.setReturnURLScheme("com.template.bookAppointment.payments")
//     return super.application(application, didFinishLaunchingWithOptions: launchOptions)
//   }
// }

import UIKit
import Flutter
import GoogleMaps


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("AIzaSyBOLwqg_rkB4vfxqduEPMW9eEcI6xznqh4")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

/*
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {

    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//           GMSServices.provideAPIKey("AIzaSyDjgUxgzitqoYObIabR-kHs17NiBPObKMc")
//       GeneratedPluginRegistrant.register(with: self)
//         BTAppContextSwitcher.setReturnURLScheme("com.example.flutterBraintreeExample.payments")
//
      return super.application(applica/tion, didFinishLaunchingWithOptions: launchOptions)
//     }


//     override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
//         if url.scheme == "com.example.flutterBraintreeExample.payments" {
//             return BTAppContextSwitcher.handleOpenURL(url)
//         }
//
//         return false
//     }

}
 */
