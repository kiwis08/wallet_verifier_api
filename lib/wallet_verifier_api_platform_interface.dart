import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'wallet_verifier_api_method_channel.dart';

abstract class WalletVerifierApiPlatform extends PlatformInterface {
  /// Constructs a WalletVerifierApiPlatform.
  WalletVerifierApiPlatform() : super(token: _token);

  static final Object _token = Object();

  static WalletVerifierApiPlatform _instance = MethodChannelWalletVerifierApi();

  /// The default instance of [WalletVerifierApiPlatform] to use.
  ///
  /// Defaults to [MethodChannelWalletVerifierApi].
  static WalletVerifierApiPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WalletVerifierApiPlatform] when
  /// they register themselves.
  static set instance(WalletVerifierApiPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> verifyAge() {
    throw UnimplementedError('verifyAge() has not been implemented.');
  }
}
