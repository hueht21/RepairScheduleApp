import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:repair_schedule_app/Controller/HomeControler.dart';
import 'package:repair_schedule_app/Controller/HomePageControl.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomePageControl controller = Get.put(HomePageControl());
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            systemNavigationBarColor: Color.fromRGBO(143, 148, 251, 1),
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
          child: GoogleMap(
            mapType: MapType.normal, // thể loại bản đồ , địa hình
            initialCameraPosition: controller.kGooglePlex,
            onMapCreated: (GoogleMapController control) {
              controller.controllerMap.complete(control);
              controller.addMarker("Test", controller.current);
            },
            markers: controller.marker.values.toSet(),
          )),
    );
  }
}
