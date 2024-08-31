
import 'wallet_verifier_api_platform_interface.dart';

class WalletVerifierApi {
  Future<String?> getPlatformVersion() {
    return WalletVerifierApiPlatform.instance.getPlatformVersion();
  }

  /// Verifies a mobile document for age verification.
  Future<void> verifyAge() {
    return WalletVerifierApiPlatform.instance.verifyAge();
  }
}
