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
    apiKey: 'AIzaSyAkSk9uOKGKlGoTjE4mn3bHHoTpd-S4SmQ',
    appId: '1:855752518878:web:79cc14e78ac7b8ae75e64f',
    messagingSenderId: '855752518878',
    projectId: 'restaurant-app-4350f',
    authDomain: 'restaurant-app-4350f.firebaseapp.com',
    storageBucket: 'restaurant-app-4350f.appspot.com',
    measurementId: 'G-S7TY8XD48L',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCphd47BRSgF1pvXKJnV2O-_WWMcbNEoYA',
    appId: '1:855752518878:android:7e9b6c1cb83e125975e64f',
    messagingSenderId: '855752518878',
    projectId: 'restaurant-app-4350f',
    storageBucket: 'restaurant-app-4350f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD7o62nf2_K0le8RYKAsj9mDEPOOjI5ilk',
    appId: '1:855752518878:ios:42bbf1836b37a71775e64f',
    messagingSenderId: '855752518878',
    projectId: 'restaurant-app-4350f',
    storageBucket: 'restaurant-app-4350f.appspot.com',
    iosBundleId: 'com.example.restaurantApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD7o62nf2_K0le8RYKAsj9mDEPOOjI5ilk',
    appId: '1:855752518878:ios:3053089579f7a03375e64f',
    messagingSenderId: '855752518878',
    projectId: 'restaurant-app-4350f',
    storageBucket: 'restaurant-app-4350f.appspot.com',
    iosBundleId: 'com.example.restaurantApplication.RunnerTests',
  );
}
