import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCkNfXP-Ee5DvX5VPOR3SHNU7B9QO9dKu0",
            authDomain: "timy-38bee.firebaseapp.com",
            projectId: "timy-38bee",
            storageBucket: "timy-38bee.appspot.com",
            messagingSenderId: "446899980017",
            appId: "1:446899980017:web:3a2843113db1e9cdc4cb50",
            measurementId: "G-WX2ZZGDEZB"));
  } else {
    await Firebase.initializeApp();
  }
}
