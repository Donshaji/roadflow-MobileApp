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
    apiKey: 'AIzaSyBuyfv0-eOSy5fZBokgedOmapQtJFRZJdk',
    appId: '1:354785046851:web:e5e8ba6b0a9a3050f13ff6',
    messagingSenderId: '354785046851',
    projectId: 'roadflow-a821a',
    authDomain: 'roadflow-a821a.firebaseapp.com',
    storageBucket: 'roadflow-a821a.appspot.com',
    measurementId: 'G-ZMXY4DEZC5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCbpFAcRyNenCLpI87hU6BhcxRBOkqdTjI',
    appId: '1:354785046851:android:ca030b1c7353f7d8f13ff6',
    messagingSenderId: '354785046851',
    projectId: 'roadflow-a821a',
    storageBucket: 'roadflow-a821a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA6juqHUzL6T1DyDPb_bCjKv2H3hrzEPq8',
    appId: '1:354785046851:ios:65ce678e902521b6f13ff6',
    messagingSenderId: '354785046851',
    projectId: 'roadflow-a821a',
    storageBucket: 'roadflow-a821a.appspot.com',
    iosBundleId: 'com.example.roadflow',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA6juqHUzL6T1DyDPb_bCjKv2H3hrzEPq8',
    appId: '1:354785046851:ios:3bc9b7c2eaa3ecb0f13ff6',
    messagingSenderId: '354785046851',
    projectId: 'roadflow-a821a',
    storageBucket: 'roadflow-a821a.appspot.com',
    iosBundleId: 'com.example.roadflow.RunnerTests',
  );
}