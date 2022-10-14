import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:repair_schedule_app/data/models/repair.dart';
import 'package:repair_schedule_app/modules/home/controllers/home_controller.dart';
import 'package:repair_schedule_app/modules/home_map/controllers/home_map_controler.dart';

class HomeMap extends StatelessWidget {
  final HomePageControl controller = Get.put(HomePageControl());

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
          child: Obx(() {
            //log("co duoc update hay khong");
            return GoogleMap(
              mapType: MapType.normal, // thể loại bản đồ , địa hình
              markers: Set<Marker>.of(controller.allMarkers),
              initialCameraPosition: controller.kGooglePlex,
              onMapCreated: (GoogleMapController control) async {
                await controller.getDataRepair();
                controller.controllerMap.complete(control);
                log(" so lương trong list ${controller.list.length}"); 
                for(Repair i in controller.list)
                {
                  log("${i.latitude} ${i.id}");
                  controller.addMarkerRepair(
                      "${i.id}",
                      controller.indexMap(
                          i.latitude, i.longitude));
                }
                controller.addMarker(
                    "Test3",
                    controller.indexMap(
                        controller.latitude.value,
                        controller.longitude
                            .value)); // đây là cái vị trí màu đỏ
                // controller.addMarkerRepair(
                //   "Test",
                //   controller.indexMap(
                //       20.986880262635534, 105.80114548285103),
                // );
                // controller.addMarkerRepair(
                //     "Test2",
                //     controller.indexMap(
                //         20.974533035238895, 105.80417179478226));
              },
            );
          }),
        ),
      ),
    );
  }
}
