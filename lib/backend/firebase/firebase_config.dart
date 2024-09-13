import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBNiM4AwICVi65hgkTxeXEf_9m0s9eTfM4",
            authDomain: "easecarapp.firebaseapp.com",
            projectId: "easecarapp",
            storageBucket: "easecarapp.appspot.com",
            messagingSenderId: "422125062613",
            appId: "1:422125062613:web:2bdf0a850227f28370155c",
            measurementId: "G-R1C62GX30J"));
  } else {
    await Firebase.initializeApp();
  }
}
