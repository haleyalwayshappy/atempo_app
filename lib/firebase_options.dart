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
    apiKey: 'AIzaSyDK6Mvrpl5RP5TF7mgHtc0xxAgy-OdMFqg',
    appId: '1:525382879421:web:560a5eb0773f7a82c70fd4',
    messagingSenderId: '525382879421',
    projectId: 'teamatempo',
    authDomain: 'teamatempo.firebaseapp.com',
    storageBucket: 'teamatempo.appspot.com',
    measurementId: 'G-GE2K79MHRM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAxWfS4iz-BCBAfJY0ERu07pgKeG9l6o3c',
    appId: '1:525382879421:android:5394d702ec3df441c70fd4',
    messagingSenderId: '525382879421',
    projectId: 'teamatempo',
    storageBucket: 'teamatempo.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCdguzCmhbjSF0jj36U8taMfLCb-P5hQ2M',
    appId: '1:525382879421:ios:5c02cc94b88a26adc70fd4',
    messagingSenderId: '525382879421',
    projectId: 'teamatempo',
    storageBucket: 'teamatempo.appspot.com',
    iosBundleId: 'com.example.atempoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCdguzCmhbjSF0jj36U8taMfLCb-P5hQ2M',
    appId: '1:525382879421:ios:5c02cc94b88a26adc70fd4',
    messagingSenderId: '525382879421',
    projectId: 'teamatempo',
    storageBucket: 'teamatempo.appspot.com',
    iosBundleId: 'com.example.atempoApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDK6Mvrpl5RP5TF7mgHtc0xxAgy-OdMFqg',
    appId: '1:525382879421:web:81912d19eabe2a91c70fd4',
    messagingSenderId: '525382879421',
    projectId: 'teamatempo',
    authDomain: 'teamatempo.firebaseapp.com',
    storageBucket: 'teamatempo.appspot.com',
    measurementId: 'G-LRDYP9S5VZ',
  );

}