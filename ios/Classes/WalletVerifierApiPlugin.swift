import Flutter
import UIKit

public class WalletVerifierApiPlugin: NSObject, FlutterPlugin {


  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "wallet_verifier_api", binaryMessenger: registrar.messenger())
    let instance = WalletVerifierApiPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

    @MainActor public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "verifyAge":
        WalletVerifierApiPluginModel.shared.verifyButtonTapped()
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
