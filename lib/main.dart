import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repair_schedule_app/routes/app_pages.dart';

void main() async {
  //initalizeFirebase();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,

    ),
  );

}
// Future<FirebaseApp> initalizeFirebase() async {
//   FirebaseApp firebaseApp = await Firebase.initializeApp();
//   return firebaseApp;
// }


