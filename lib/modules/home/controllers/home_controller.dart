import 'package:get/get.dart';

class HomeControler extends GetxController{

  var selectIndex =0.obs;
  var Uidd = Get.arguments;
  String UID = "";
  //HomeControler(this.UID);
  void setIndex(int index)
  {
    selectIndex.value = index;
    //update();
  }
}