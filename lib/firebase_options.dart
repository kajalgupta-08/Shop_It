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
    apiKey: 'AIzaSyCTLmbqaAXvGRD5uQxEBtUaID89qIW4vys',
    appId: '1:1072976806399:web:23291c43a443f2baab27ca',
    messagingSenderId: '1072976806399',
    projectId: 'fir-new-9c1a8',
    authDomain: 'fir-new-9c1a8.firebaseapp.com',
    storageBucket: 'fir-new-9c1a8.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAnaDDuOyZN_Kqs09jtIfmfdgOZzW2AqPs',
    appId: '1:1072976806399:android:b2da9bf344643aa2ab27ca',
    messagingSenderId: '1072976806399',
    projectId: 'fir-new-9c1a8',
    storageBucket: 'fir-new-9c1a8.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCUhLZgQ4Y6rSZdVX4R4NnAzVJ5nGKLgXM',
    appId: '1:1072976806399:ios:0aa74a5cff681228ab27ca',
    messagingSenderId: '1072976806399',
    projectId: 'fir-new-9c1a8',
    storageBucket: 'fir-new-9c1a8.firebasestorage.app',
    iosBundleId: 'com.example.shoppingApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCUhLZgQ4Y6rSZdVX4R4NnAzVJ5nGKLgXM',
    appId: '1:1072976806399:ios:0aa74a5cff681228ab27ca',
    messagingSenderId: '1072976806399',
    projectId: 'fir-new-9c1a8',
    storageBucket: 'fir-new-9c1a8.firebasestorage.app',
    iosBundleId: 'com.example.shoppingApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCTLmbqaAXvGRD5uQxEBtUaID89qIW4vys',
    appId: '1:1072976806399:web:0682657d7066421bab27ca',
    messagingSenderId: '1072976806399',
    projectId: 'fir-new-9c1a8',
    authDomain: 'fir-new-9c1a8.firebaseapp.com',
    storageBucket: 'fir-new-9c1a8.firebasestorage.app',
  );
}
