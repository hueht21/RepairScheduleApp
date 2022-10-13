
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';



class LoginControler extends GetxController {

  String UID = "";
  Future<FirebaseApp> initalizeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  Future<User?> loginUsingEmailPasss({required String email, required String pass, required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential =
      await auth.signInWithEmailAndPassword(email: email, password: pass);
      user = userCredential.user;
      UID =  user!.uid;
      log("uid" + user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("Khong tim thay email");
      }
    }
    //final uid = user.uid;
    return user;
  }

  void Loginn({required String email, required String pass, required BuildContext context}) async
  {
    //_onLoading(context);
    User? user = await loginUsingEmailPasss(email: email, pass: pass, context: context);
    if (user != null) {
      Get.snackbar("Thông báo", "Đăng nhập thành công",
          margin: const EdgeInsets.only(top: 6, left: 3, right: 3),
          colorText: Colors.black,
          backgroundColor: Colors.white);
          //if(firebase.auth().currentUser)
          Get.toNamed("/home", arguments: [UID]);

      //print(user);
    } else {
      Get.snackbar("Thông báo", "Email và mật khẩu không đúng",
          margin: const EdgeInsets.only(top: 6, left: 10, right: 10),
          colorText: Colors.black,
          backgroundColor: Colors.white);
    }
  }

}