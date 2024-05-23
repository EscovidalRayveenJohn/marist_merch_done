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
    apiKey: 'AIzaSyD9Ps55LItFzf34GA_wEFwL55Jzs-X1AlQ',
    appId: '1:714392282033:web:e97cab776c4215dd2e9390',
    messagingSenderId: '714392282033',
    projectId: 'maristcommerce-4b155',
    authDomain: 'maristcommerce-4b155.firebaseapp.com',
    storageBucket: 'maristcommerce-4b155.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD9Ps55LItFzf34GA_wEFwL55Jzs-X1AlQ',
    appId: '1:714392282033:web:e97cab776c4215dd2e9390',
    messagingSenderId: '714392282033',
    projectId: 'maristcommerce-4b155',
    storageBucket: 'maristcommerce-4b155.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD9Ps55LItFzf34GA_wEFwL55Jzs-X1AlQ',
    appId: '1:714392282033:web:e97cab776c4215dd2e9390',
    messagingSenderId: '714392282033',
    projectId: 'maristcommerce-4b155',
    storageBucket: 'maristcommerce-4b155.appspot.com',
    iosBundleId: 'com.example.maristcommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD9Ps55LItFzf34GA_wEFwL55Jzs-X1AlQ',
    appId: '1:714392282033:web:e97cab776c4215dd2e9390',
    messagingSenderId: '714392282033',
    projectId: 'maristcommerce-4b155',
    storageBucket: 'maristcommerce-4b155.appspot.com',
    iosBundleId: 'com.example.maristcommerce',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD9Ps55LItFzf34GA_wEFwL55Jzs-X1AlQ',
    appId: '1:714392282033:web:e97cab776c4215dd2e9390',
    messagingSenderId: '714392282033',
    projectId: 'maristcommerce-4b155',
    authDomain: 'maristcommerce-4b155.firebaseapp.com',
    storageBucket: 'maristcommerce-4b155.appspot.com',
  );
}
