
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:repair_schedule_app/View/Home.dart';



class LoginControl {
  static Future<User?> loginUsingEmailPasss({ required String email, required String pass , required BuildContext context}) async {
      FirebaseAuth auth = FirebaseAuth.instance;
      User? user ;
      try {
        UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: pass);
        user = userCredential.user;

      } on FirebaseAuthException catch(e) {
        if(e.code == "user-not-found")
          {
            print("Khong tim thay email");
          }
      }
      return user;
  }
  static void Loginn({required String email, required String pass, required BuildContext context}) async
  {
    //_onLoading(context);
    User? user = await LoginControl.loginUsingEmailPasss(email: email, pass: pass, context: context);
    if (user != null) {
      Get.snackbar("Thông báo", "Đăng nhập thành công",
          margin: const EdgeInsets.only(top: 6, left: 3, right: 3),
          colorText: Colors.black,
          backgroundColor: Colors.white);

      //Get.to(Home());
      Get.to(() => Home());

      //print(user);
    } else {
      Get.snackbar("Thông báo", "Email và mật khẩu không đúng",
          margin: const EdgeInsets.only(top: 6, left: 10, right: 10),
          colorText: Colors.black,
          backgroundColor: Colors.white);
    }
  }
  static void _onLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: SizedBox(
            height: 70,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                SizedBox(width: 10,),
                 CircularProgressIndicator(strokeWidth: 3.0,),
                SizedBox(width: 10,),
                 Text("Loading"),
              ],
            ),
          ),
        );
      },
    );
     Future.delayed( const Duration(seconds: 2), () {
      Navigator.pop(context); //pop dialog

    });
  }
}