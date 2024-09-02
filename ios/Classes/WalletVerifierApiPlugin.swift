import Flutter
import ProximityReader
import UIKit

public class WalletVerifierApiPlugin: NSObject, FlutterPlugin {
    
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "wallet_verifier_api", binaryMessenger: registrar.messenger())
        let instance = WalletVerifierApiPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    @MainActor public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if #available(iOS 17.0, *) {
            switch call.method {
            case "verifyAge":
                guard let args = call.arguments as? [String: Any],
                      let elements = args["elements"] as? [[String: Any]] else {
                    result(FlutterError(code: "INVALID_ARGUMENT", message: "Invalid arguments", details: nil))
                    return
                }
                
                var requestElements: [MobileDriversLicenseDisplayRequest.Element] = []
                
                for element in elements {
                    if let type = element["type"] as? String {
                        switch type {
                        case "givenName":
                            requestElements.append(.givenName)
                        case "familyName":
                            requestElements.append(.familyName)
                        case "age":
                            requestElements.append(.age)
                        case "ageAtLeast":
                            if let age = element["age"] as? Int {
                                requestElements.append(.ageAtLeast(age))
                            }
                        default:
                            break
                        }
                    }
                }
                
                do {
                    try WalletVerifierApiPluginModel.shared.startVerification(elements: requestElements)
                    result(nil)
                } catch {
                    result(FlutterError(code: "INTERNAL_ERROR", message: error.localizedDescription, details: nil))
                }
            case "isSupported":
                result(WalletVerifierApiPluginModel.shared.isSupported())
            default:
                result(FlutterMethodNotImplemented)
            }
        } else {
            if call.method == "isSupported" {
                result(false)
            } else {
                result(FlutterError(code: "UNSUPPORTED_IOS_VERSION", message: "iOS 17.0 or higher is required for this feature.", details: nil))
            }
        }
    }
}
