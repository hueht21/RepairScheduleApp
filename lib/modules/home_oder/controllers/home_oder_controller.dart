import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:repair_schedule_app/data/models/RepairSchedule.dart';

class HomeOderController extends GetxController{
  RxInt index = 0.obs;
  @override
  void onInit()  async {
    // TODO: implement onInit
    super.onInit();
    await getDataWaiting();
  }
  Future getDataWaiting() async
  {
     await FirebaseFirestore.instance.
     collection("RegistrationSchedule").where("Status" , isEqualTo: 0).get().
     then((value) => value.docs.forEach((element) {
          log("dya la data tong ${element.data()}");
          RepairSchedule repairSchedule = setRepairSchedule(element.data());
          //RepairSchedule repairSchedule = RepairSchedule.fromMap(element.data());

          log("data repair schedule ${repairSchedule.phone}" );

     }));
  }
  RepairSchedule setRepairSchedule(Map<String, dynamic> map)
  {
     return RepairSchedule.fromMap(map);
  }

  void setIndex(int index){
    this.index.value = index;
  }

}