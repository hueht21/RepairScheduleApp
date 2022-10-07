import 'package:get/get.dart';

class HomeControler extends GetxController{

  var selectIndex =0;
  void setIndex(int index)
  {
    selectIndex = index;
    update();
  }
}