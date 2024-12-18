// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyA651vHDymZ3aEhDNcMudBH7v2vV1Nv2-w',
    appId: '1:519757623779:web:97094baa6f97d76fa8f0d6',
    messagingSenderId: '519757623779',
    projectId: 'guideme-117',
    authDomain: 'guideme-117.firebaseapp.com',
    storageBucket: 'guideme-117.firebasestorage.app',
    measurementId: 'G-HKWKBGL7KX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA-z1-pUZiPyHroOFatEttd38FCfsCD530',
    appId: '1:519757623779:android:7c3f81d101dff276a8f0d6',
    messagingSenderId: '519757623779',
    projectId: 'guideme-117',
    storageBucket: 'guideme-117.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBhsjAQkRysJWaAIphcWcoGE0MtXZuyU6Y',
    appId: '1:519757623779:ios:5e949b7ae8e8d67ea8f0d6',
    messagingSenderId: '519757623779',
    projectId: 'guideme-117',
    storageBucket: 'guideme-117.firebasestorage.app',
    iosBundleId: 'com.example.guideMe',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBhsjAQkRysJWaAIphcWcoGE0MtXZuyU6Y',
    appId: '1:519757623779:ios:5e949b7ae8e8d67ea8f0d6',
    messagingSenderId: '519757623779',
    projectId: 'guideme-117',
    storageBucket: 'guideme-117.firebasestorage.app',
    iosBundleId: 'com.example.guideMe',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA651vHDymZ3aEhDNcMudBH7v2vV1Nv2-w',
    appId: '1:519757623779:web:997fbd811c8478c1a8f0d6',
    messagingSenderId: '519757623779',
    projectId: 'guideme-117',
    authDomain: 'guideme-117.firebaseapp.com',
    storageBucket: 'guideme-117.firebasestorage.app',
    measurementId: 'G-N3V7GCRGSE',
  );

}