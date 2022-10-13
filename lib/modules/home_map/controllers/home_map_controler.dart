import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:repair_schedule_app/modules/home/controllers/home_controller.dart';
import 'package:repair_schedule_app/modules/login/controllers/login_controllers.dart';

import '../../../Utils/img.dart';
import '../views/item_bottom_sheet.dart';

class HomePageControl extends GetxController {
  RxDouble latitude = 20.99213800591695.obs;
  RxDouble longitude = 105.81020471504765.obs;
  late StreamSubscription<Position> streamSubscription;
  late BitmapDescriptor icon;
  late BitmapDescriptor iconRepair;
  int idex =0;
   @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    log("đã được đóng vào đây ");
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    log("đã được vào redy ");

  }

  @override
  void onInit() async {
    super.onInit();

    await loadIcon();
    await loadIconRepair();
    await getLocation();
    //log("dữ liệu UID đã chuyển đổi sang màn mới" + HomeControler.Uid);
    //getLatitude();
    // await BitmapDescriptor.fromAssetImage(const ImageConfiguration(size: Size(48, 48)), "assets/img/map.png")
    //     .then((onValue) {
    //       myIcon = onValue;
    //     });

    log("dayyy ");
  }
  //LoginControler loginControler = Lo
  getLocation() async {
    bool serviceEnable;
    LocationPermission permission;
    serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      await Geolocator.openLocationSettings();
      return Future.error("Location service are disable");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {

        return Future.error("Location service are disable");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location service are disable");
    }

    streamSubscription =
        Geolocator.getPositionStream().listen((Position position) {
          Marker marker = allMarkers.firstWhere((marker) => marker.markerId.value == "Test3");
          allMarkers.remove(marker);
          addMarker('Test3', LatLng(position.latitude, position.longitude));
      latitude.value = position.latitude;
      longitude.value = position.longitude;
    });
  }
  late GoogleMapController mapController;
  final Completer<GoogleMapController> controllerMap = Completer();
  RxList<Marker> allMarkers = RxList([]);

  indexMap(double x, double y) {
    LatLng current = LatLng(x, y);
    return current;
  }

  LatLng current2 = const LatLng(20.97902398945378, 105.79489933934353);
  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(20.98309121380638, 105.80134688698458),
    zoom: 14.4746,
  );

  Future<void> loadIcon() async {
    icon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(68, 68)),
        iconUser);
    // return icons;
  }

  Future<void> loadIconRepair() async {
    iconRepair = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(68, 68)), iconUserRepair);
    // return icons;
  }

  addMarker(String id, LatLng location) {
    var maker = Marker(
        markerId: MarkerId(id),
        position: location,
        infoWindow: const InfoWindow(
            title: "Vị trí của bạn",
            snippet: "Bạn có tìm kiếm các thợ xung quanh"),
        icon: icon);
    allMarkers.add(maker);
  }

  addMarkerRepair(String id, LatLng local) {
    var maker = Marker(
        markerId: MarkerId(id),
        position: local,
        // infoWindow: const InfoWindow(
        //     title: "Đinh Văn Khánh",
        //     snippet: "Có kinh nghiệm 4 năm"),
        icon: iconRepair,
        onTap: ()
        {
          idex ++;
          if(idex == 1) {
              log("da vao dayy 1");
              Get.bottomSheet(
                ItemRepairView(),
                //barrierColor: Colors.red[50],
                isDismissible: false,
              );
            }
          else {
            idex = 0;
          }
      }
    );
    allMarkers.add(maker);
  }
}
