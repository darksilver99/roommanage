import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAxScmhZ1SC_YjvbxeJVrboZ77l4VbRG1M",
            authDomain: "room-manage-ppqolm.firebaseapp.com",
            projectId: "room-manage-ppqolm",
            storageBucket: "room-manage-ppqolm.appspot.com",
            messagingSenderId: "663075340578",
            appId: "1:663075340578:web:f74d008c8e529d8dd6e57b"));
  } else {
    await Firebase.initializeApp();
  }
}
