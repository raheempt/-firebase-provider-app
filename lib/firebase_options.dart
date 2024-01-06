// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC6-RyvHRzOklMm1TO1TvKYtXJB4FDJXZ0',
    appId: '1:421420811936:web:10519e27a2fd33c2ee2bc5',
    messagingSenderId: '421420811936',
    projectId: 'providerfirebase-f3f52',
    authDomain: 'providerfirebase-f3f52.firebaseapp.com',
    storageBucket: 'providerfirebase-f3f52.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBQoKi4y96lQm1Y19mT1hnDhYhGfKXyCIU',
    appId: '1:421420811936:android:4a21663a752b349eee2bc5',
    messagingSenderId: '421420811936',
    projectId: 'providerfirebase-f3f52',
    storageBucket: 'providerfirebase-f3f52.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAKCNEKwPSaFeHUqy-GLiaicJ38O_c8D2E',
    appId: '1:421420811936:ios:043fff676e760ea5ee2bc5',
    messagingSenderId: '421420811936',
    projectId: 'providerfirebase-f3f52',
    storageBucket: 'providerfirebase-f3f52.appspot.com',
    iosBundleId: 'com.example.firebaseProvider',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAKCNEKwPSaFeHUqy-GLiaicJ38O_c8D2E',
    appId: '1:421420811936:ios:5e353c0b76975bd0ee2bc5',
    messagingSenderId: '421420811936',
    projectId: 'providerfirebase-f3f52',
    storageBucket: 'providerfirebase-f3f52.appspot.com',
    iosBundleId: 'com.example.firebaseProvider.RunnerTests',
  );
}