import 'mobile_drivers_license_element.dart';
import 'wallet_verifier_api_platform_interface.dart';

export 'mobile_drivers_license_element.dart';

class WalletVerifierApi {

  /// Verifies a mobile document for age verification.
  Future<void> verifyAge(List<MobileDriversLicenseElement> elements,
      {int? age}) {
    if (elements.contains(MobileDriversLicenseElement.ageAtLeast) && age == null) {
      throw ArgumentError('age must be provided when ageAtLeast is included in elements');
    }
    return WalletVerifierApiPlatform.instance.verifyAge(elements, age: age);
  }
}


