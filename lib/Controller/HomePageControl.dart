import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:repair_schedule_app/Utils/svg.dart';

import '../Utils/img.dart';

class HomePageControl extends GetxController {

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    // loadIcon();
    // addMarker("Test", current);
  }

  @override
  void onInit() {
    super.onInit();
    // await BitmapDescriptor.fromAssetImage(const ImageConfiguration(size: Size(48, 48)), "assets/img/map.png")
    //     .then((onValue) {
    //       myIcon = onValue;
    //     });

  }

  late GoogleMapController mapController;
  final Completer<GoogleMapController> controllerMap = Completer();
  indexMap(double x, double y)
  {
    LatLng current =  LatLng(x, y);
    return current;
  }

  //LatLng current2 = const LatLng(20.97902398945378, 105.79489933934353);
  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(20.98309121380638, 105.80134688698458),
    zoom: 14.4746,
  );
  Map<String, Marker> marker = {};
  BitmapDescriptor? myIcon;
  Future<BitmapDescriptor> loadIcon() async {
    BitmapDescriptor icons = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(48, 48)), "assets/img/mapicon.png");
    return icons;
  }

  addMarker(String id, LatLng location) async {
    var maker = Marker(
      markerId: MarkerId(id),
      position: location,
      infoWindow: const InfoWindow(
          title: "Vị trí của bạn",
          snippet: "Bạn có tìm kiếm các thợ xung quanh"),
      icon: await loadIcon()
    );
   // marker.addAll(maker)
    marker[id] = maker;
    //markerrr = maker;
  }
}
