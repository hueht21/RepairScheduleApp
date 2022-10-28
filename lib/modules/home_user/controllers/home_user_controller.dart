

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:repair_schedule_app/modules/home/views/home_view.dart';
import 'package:repair_schedule_app/modules/home_user/views/home_user_view.dart';

import '../../../data/models/user.dart';

class HomeUserController extends GetxController{

  RxList<User> listUser = RxList([]);
  var Uidd = Get.arguments;
  User? user;
  @override
  void onInit() async {

    super.onInit();
    await getDataUser();
    
  }
  Future getDataUser()async
  {
    await FirebaseFirestore.instance.collection("Customer").where("id",isEqualTo: "${Uidd[0]}").get().then((value) => value.docs.forEach((element) {
      user = User.formJson(element.data());
      log("data uaid day ${Uidd}");
      //listUser.add(user);

    }));
  }

}