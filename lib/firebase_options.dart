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
    apiKey: 'AIzaSyCx05eg4kXYrUBY3K4l49gGU20PQ-B5XZM',
    appId: '1:872292737485:web:6ff898e7e0a329edf9e484',
    messagingSenderId: '872292737485',
    projectId: 'menu-de715',
    authDomain: 'menu-de715.firebaseapp.com',
    storageBucket: 'menu-de715.firebasestorage.app',
    measurementId: 'G-DWH3HSJQL6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDA65stu05JCHnub8jjTzFf0hg43b7Mr4w',
    appId: '1:872292737485:android:adb9cb937975833bf9e484',
    messagingSenderId: '872292737485',
    projectId: 'menu-de715',
    storageBucket: 'menu-de715.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyADVnDGtDRAoPItXVyPALaL-9srGSGegs8',
    appId: '1:872292737485:ios:cf177f3af28668e6f9e484',
    messagingSenderId: '872292737485',
    projectId: 'menu-de715',
    storageBucket: 'menu-de715.firebasestorage.app',
    iosBundleId: 'com.example.menuLateral',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyADVnDGtDRAoPItXVyPALaL-9srGSGegs8',
    appId: '1:872292737485:ios:cf177f3af28668e6f9e484',
    messagingSenderId: '872292737485',
    projectId: 'menu-de715',
    storageBucket: 'menu-de715.firebasestorage.app',
    iosBundleId: 'com.example.menuLateral',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCx05eg4kXYrUBY3K4l49gGU20PQ-B5XZM',
    appId: '1:872292737485:web:a996e9d25579af3ff9e484',
    messagingSenderId: '872292737485',
    projectId: 'menu-de715',
    authDomain: 'menu-de715.firebaseapp.com',
    storageBucket: 'menu-de715.firebasestorage.app',
    measurementId: 'G-J9LL8KD1B6',
  );
}
