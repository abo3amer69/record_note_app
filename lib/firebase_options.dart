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
    apiKey: 'AIzaSyCMCfpwM_1wadLZFtLjcXgkFto-nGKkzdw',
    appId: '1:495985051598:web:cde4430ca8d871bfdb4d9f',
    messagingSenderId: '495985051598',
    projectId: 'record-notes-app',
    authDomain: 'record-notes-app.firebaseapp.com',
    storageBucket: 'record-notes-app.appspot.com',
    measurementId: 'G-9462YS0H00',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDB5M7vRYtUsOxlczrxCfW2FXwMGH2nLhw',
    appId: '1:495985051598:android:8af16836e599ea68db4d9f',
    messagingSenderId: '495985051598',
    projectId: 'record-notes-app',
    storageBucket: 'record-notes-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBHXbQxtTBIl8EtJZlbSkNDH3y8uSJapn0',
    appId: '1:495985051598:ios:633f80bd77dbfabadb4d9f',
    messagingSenderId: '495985051598',
    projectId: 'record-notes-app',
    storageBucket: 'record-notes-app.appspot.com',
    iosBundleId: 'com.example.recordNotesApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBHXbQxtTBIl8EtJZlbSkNDH3y8uSJapn0',
    appId: '1:495985051598:ios:633f80bd77dbfabadb4d9f',
    messagingSenderId: '495985051598',
    projectId: 'record-notes-app',
    storageBucket: 'record-notes-app.appspot.com',
    iosBundleId: 'com.example.recordNotesApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCMCfpwM_1wadLZFtLjcXgkFto-nGKkzdw',
    appId: '1:495985051598:web:a6e82ffb79583a81db4d9f',
    messagingSenderId: '495985051598',
    projectId: 'record-notes-app',
    authDomain: 'record-notes-app.firebaseapp.com',
    storageBucket: 'record-notes-app.appspot.com',
    measurementId: 'G-GLCXCKLYR5',
  );
}
