import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import '../env/env_init.dart';

class DefaultFirebaseOptions {

  static FirebaseOptions currentPlatform(Env env) {
    if (kIsWeb ) {
      if(env == Env.dev){
        return dev;
      }else{
        return dev;
      }
    }else{
      return dev;
    }
  }

  static const FirebaseOptions dev = FirebaseOptions(
    apiKey: "AIzaSyAgFycYSyRxi6ZzMQ9wYkPFqSR4umswfuI",
    authDomain: "portfolio-builder-57d7d.firebaseapp.com",
    projectId: "portfolio-builder-57d7d",
    storageBucket: "portfolio-builder-57d7d.appspot.com",
    messagingSenderId: "147077811322",
    appId: "1:147077811322:web:941c1c13111d5b43edffc3",
    measurementId: "G-1H81VQ1018"
  );

}