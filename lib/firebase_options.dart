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
    apiKey: 'AIzaSyAWAmhx-7SiXPEyYrgnhHpZk5z2D9t_M78',
    appId: '1:874348847334:web:c01cdea902ee8746125b27',
    messagingSenderId: '874348847334',
    projectId: 'danzify',
    authDomain: 'danzify.firebaseapp.com',
    storageBucket: 'danzify.appspot.com',
    measurementId: 'G-6TG9HER892',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDf_atnB9MmL2JwlxedaGiR26WHPZQ4dTw',
    appId: '1:874348847334:android:d62e4abecbd0e3a6125b27',
    messagingSenderId: '874348847334',
    projectId: 'danzify',
    storageBucket: 'danzify.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCFLcRBfRc4R163T81GZp7NdoFDBMFRYOY',
    appId: '1:874348847334:ios:2c67321a3055022a125b27',
    messagingSenderId: '874348847334',
    projectId: 'danzify',
    storageBucket: 'danzify.appspot.com',
    iosBundleId: 'com.example.quiz',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCFLcRBfRc4R163T81GZp7NdoFDBMFRYOY',
    appId: '1:874348847334:ios:2c67321a3055022a125b27',
    messagingSenderId: '874348847334',
    projectId: 'danzify',
    storageBucket: 'danzify.appspot.com',
    iosBundleId: 'com.example.quiz',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAWAmhx-7SiXPEyYrgnhHpZk5z2D9t_M78',
    appId: '1:874348847334:web:110374a2afb79146125b27',
    messagingSenderId: '874348847334',
    projectId: 'danzify',
    authDomain: 'danzify.firebaseapp.com',
    storageBucket: 'danzify.appspot.com',
    measurementId: 'G-5V6Z3CYPDV',
  );
}
