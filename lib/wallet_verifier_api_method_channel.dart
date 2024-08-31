import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'wallet_verifier_api_platform_interface.dart';

/// An implementation of [WalletVerifierApiPlatform] that uses method channels.
class MethodChannelWalletVerifierApi extends WalletVerifierApiPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('wallet_verifier_api');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> verifyAge() async {
    await methodChannel.invokeMethod<void>('verifyAge');
  }
}
