import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:repair_schedule_app/modules/home/controllers/home_controller.dart';
import 'package:repair_schedule_app/modules/home_map/controllers/home_map_controler.dart';

class HomeMap extends StatefulWidget {
  @override
  State<HomeMap> createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
  final HomePageControl controller = Get.put(HomePageControl());


  @override
  void initState() {
    super.initState();
   log("message1");
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            systemNavigationBarColor: Color.fromRGBO(143, 148, 251, 1),
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
          child: SafeArea(
            child: Column(
              children: [
                Obx(() => Text("data + ${controller.latitude.value}", style: TextStyle(fontSize: 24),)),// chỗ này nó render rồi, chỗ này nó hiển thị vị trí của mình ấy
                Expanded(
                  // nhưng sao mình thấy cái giá trị ở trên lại thay đổi ấy b
                  // Cái đấy work đúng theo Getx rồi. Còn cái ở dưới có thể là do tọa độ được thay đổi Nhưng nó không chạy lại vào cái dòng 52 kia. Tức cái Widget đấy chỉ được khởi tạo 1 lần và cái màu đỏ được hiển thị chỉ lần đầu khi hàm onMapCreated chạy
                  child: Obx((){
                    log("co duoc update hay khong");
                    return GoogleMap(
                    mapType: MapType.normal, // thể loại bản đồ , địa hình
                    markers:Set<Marker>.of(controller.allMarkers),
                    initialCameraPosition: controller.kGooglePlex,
                    onMapCreated: (GoogleMapController control) async {
                      controller.controllerMap.complete(control);
                      log("message");
                      controller.addMarkerRepair("Test3",controller.indexMap(controller.latitude.value, controller.longitude.value));// đây là cái vị trí màu đỏ
                      // còn ở dòng 49 dưới nay lại chưa render
                      // thế còn 2 cái ở dưới này để làm gì. 2 cái đầy là mình fix cứng thợ sửa thôpi
                      controller.addMarker("Test", controller.indexMap( 20.986880262635534, 105.80114548285103),);
                      controller.addMarker("Test2",controller.indexMap(20.974533035238895, 105.80417179478226));
                    },
                    // lần chậy đầu nó lấy điijnh vị cũ ở đay này b
                    //markers: controller.allMarkers.toSet(),
                    //markers: Set<Marker>.of(controller.listMaker),
                  );}),
                ),
              ],
            ),
          ),),
    );
  }
}
