# wallet_verifier_api

This plugin is a wrapper around the iOS Verifier API.
You can learn more about the Verifier API [here](https://developer.apple.com/wallet/id-verifier/).

This plugin is still in development and currently only supports display-only capabilities.

## Requirements

- iOS >=13.0*

*While the plugin is compatible with iOS 13.0, the Verifier API is only available on iOS 17.0 and later. Any calls to the plugin (except for the `isSupported` method) will return a `UNSUPPORTED_IOS_VERSION` error below iOS 17.0.

## Usage

First, add `wallet_verifier_api` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/packages-and-plugins/using-packages).

```yaml
dependencies:
  wallet_verifier_api: ^0.0.4
```

Then, import the library:

```dart
import 'package:wallet_verifier_api/wallet_verifier_api.dart';
```

## Example

```dart

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
          child: Row(
            children: [
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
```


