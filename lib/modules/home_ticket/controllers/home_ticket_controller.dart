import 'package:get/get.dart';

class HomeTicketController extends GetxController{
  RxInt checkIndex = 0.obs;
  void setIndex(int index)
  {
    checkIndex.value = index;
  }

}