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
    apiKey: 'AIzaSyCbuegWVhSHwoHEOwnL5t_JdFdRn8KIagY',
    appId: '1:535910472263:web:25a7da0cdb9d3bbe62af62',
    messagingSenderId: '535910472263',
    projectId: 'quite-mate',
    authDomain: 'quite-mate.firebaseapp.com',
    storageBucket: 'quite-mate.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCoQiIqkQ4ECLGPsFcH2JjxYrvIvINhC5s',
    appId: '1:535910472263:android:1a76d0aadf2b7e7162af62',
    messagingSenderId: '535910472263',
    projectId: 'quite-mate',
    storageBucket: 'quite-mate.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBmobOBkexu6eV5DIfPm2wIgKg8mFckdso',
    appId: '1:535910472263:ios:f54165b106418db562af62',
    messagingSenderId: '535910472263',
    projectId: 'quite-mate',
    storageBucket: 'quite-mate.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBmobOBkexu6eV5DIfPm2wIgKg8mFckdso',
    appId: '1:535910472263:ios:d663551cb824305762af62',
    messagingSenderId: '535910472263',
    projectId: 'quite-mate',
    storageBucket: 'quite-mate.appspot.com',
    iosBundleId: 'com.example.flutterApplication1.RunnerTests',
  );
}
