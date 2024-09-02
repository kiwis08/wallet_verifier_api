import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'mobile_drivers_license_element.dart';
import 'wallet_verifier_api_platform_interface.dart';

/// An implementation of [WalletVerifierApiPlatform] that uses method channels.
class MethodChannelWalletVerifierApi extends WalletVerifierApiPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('wallet_verifier_api');

  @override
  Future<void> verifyAge(List<MobileDriversLicenseElement> elements,
      {int? age}) async {
    final List<Map<String, dynamic>> elementData = elements.map((element) {
      switch (element) {
        case MobileDriversLicenseElement.givenName:
          return {'type': 'givenName'};
        case MobileDriversLicenseElement.familyName:
          return {'type': 'familyName'};
        case MobileDriversLicenseElement.age:
          return {'type': 'age'};
        case MobileDriversLicenseElement.ageAtLeast:
          return {'type': 'ageAtLeast', 'age': age};
      }
    }).toList();
    await methodChannel.invokeMethod<void>('verifyAge', {'elements': elementData});
  }
}
