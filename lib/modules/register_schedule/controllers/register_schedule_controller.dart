
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:repair_schedule_app/data/models/RepairSchedule.dart';

class RegisterScheduleController extends GetxController{
  RxString dateTime = "Hôm nay".obs;
  Rx<TimeOfDay> time =  const TimeOfDay(hour: 10, minute: 30).obs;
  Future insertData(RepairSchedule repairSchedule) async
  {
    final obj = repairSchedule.toJson();
     CollectionReference datb = FirebaseFirestore.instance.collection("RegistrationSchedule");
     await datb.add(obj);
  }

}