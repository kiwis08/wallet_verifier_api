import 'package:flutter/material.dart';
import 'package:wallet_verifier_api/wallet_verifier_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _walletVerifierApiPlugin = WalletVerifierApi();

  bool? isSupported = null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Verifier API Example'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  final supported = await _walletVerifierApiPlugin.isSupported();
                  setState(() {
                    isSupported = supported;
                  });
                },
                child: const Text('Is Supported'),
              ),
              Text('Is Supported: $isSupported\n'),


              ElevatedButton(
                onPressed: () {
                  _walletVerifierApiPlugin.verifyAge([
                    MobileDriversLicenseElement.givenName,
                    MobileDriversLicenseElement.familyName,
                    MobileDriversLicenseElement.ageAtLeast,
                  ], age: 21);
                },
                child: const Text('Verify Age'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
