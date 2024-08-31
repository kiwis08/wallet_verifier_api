import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_verifier_api/wallet_verifier_api.dart';
import 'package:wallet_verifier_api/wallet_verifier_api_platform_interface.dart';
import 'package:wallet_verifier_api/wallet_verifier_api_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWalletVerifierApiPlatform
    with MockPlatformInterfaceMixin
    implements WalletVerifierApiPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<void> verifyAge() {
    // TODO: implement verifyAge
    throw UnimplementedError();
  }
}

void main() {
  final WalletVerifierApiPlatform initialPlatform = WalletVerifierApiPlatform.instance;

  test('$MethodChannelWalletVerifierApi is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWalletVerifierApi>());
  });

  test('getPlatformVersion', () async {
    WalletVerifierApi walletVerifierApiPlugin = WalletVerifierApi();
    MockWalletVerifierApiPlatform fakePlatform = MockWalletVerifierApiPlatform();
    WalletVerifierApiPlatform.instance = fakePlatform;

    expect(await walletVerifierApiPlugin.getPlatformVersion(), '42');
  });
}
