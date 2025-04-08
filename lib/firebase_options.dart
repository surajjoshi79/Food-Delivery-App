import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAsHkTws0wQHa2qHpzVfS7HQt18GuwdbOA',
    appId: '1:497319000226:android:5fdc82b20a045856e77ffb',
    messagingSenderId: '497319000226',
    projectId: 'food-delivery-firebase-8324c',
    storageBucket: 'food-delivery-firebase-8324c.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB9_PIU37JTy922hrWuzs82e1G6ty8KbKA',
    appId: '1:497319000226:ios:13e5444a5127c589e77ffb',
    messagingSenderId: '497319000226',
    projectId: 'food-delivery-firebase-8324c',
    storageBucket: 'food-delivery-firebase-8324c.firebasestorage.app',
    iosBundleId: 'com.example.foodDeliveryApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB9_PIU37JTy922hrWuzs82e1G6ty8KbKA',
    appId: '1:497319000226:ios:13e5444a5127c589e77ffb',
    messagingSenderId: '497319000226',
    projectId: 'food-delivery-firebase-8324c',
    storageBucket: 'food-delivery-firebase-8324c.firebasestorage.app',
    iosBundleId: 'com.example.foodDeliveryApp',
  );
}
