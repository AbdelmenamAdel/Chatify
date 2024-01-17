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
    apiKey: 'AIzaSyDjqk27a55azjrBV1H0qFrjxn7fbQFKNGA',
    appId: '1:221159896402:web:090d8bb43927cbe621768b',
    messagingSenderId: '221159896402',
    projectId: 'chat-app-9cb5d',
    authDomain: 'chat-app-9cb5d.firebaseapp.com',
    storageBucket: 'chat-app-9cb5d.appspot.com',
    measurementId: 'G-F58JPLGL6W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBVclGOPhEEFoNmCtdlQoJErD7ZsmhZs-E',
    appId: '1:221159896402:android:6e7dddb4ecc3677f21768b',
    messagingSenderId: '221159896402',
    projectId: 'chat-app-9cb5d',
    storageBucket: 'chat-app-9cb5d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDVLNF_nzpOkni4wsEY7zeVqBhQfyPqv2k',
    appId: '1:221159896402:ios:91354145aefd788e21768b',
    messagingSenderId: '221159896402',
    projectId: 'chat-app-9cb5d',
    storageBucket: 'chat-app-9cb5d.appspot.com',
    iosBundleId: 'com.example.chatify',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDVLNF_nzpOkni4wsEY7zeVqBhQfyPqv2k',
    appId: '1:221159896402:ios:8527789fe44bb73021768b',
    messagingSenderId: '221159896402',
    projectId: 'chat-app-9cb5d',
    storageBucket: 'chat-app-9cb5d.appspot.com',
    iosBundleId: 'com.example.chatify.RunnerTests',
  );
}