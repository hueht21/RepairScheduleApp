import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:repair_schedule_app/Utils/svg.dart';

import '../Utils/img.dart';

class HomePageControl extends GetxController{
  @override
  // TODO: implement onStart
  InternalFinalCallback<void> get onStart => super.onStart;

  @override
  void update([List<Object>? ids, bool condition = true]) {
    // TODO: implement update
    super.update(ids, condition);
    loadIcon();
    addMarker("Test",current);
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    loadIcon();
    addMarker("Test",current);
  }
  @override
  void onInit() {
    // super.onInit();
    // loadIcon();
    // await BitmapDescriptor.fromAssetImage(const ImageConfiguration(size: Size(48, 48)), "assets/img/map.png")
    //     .then((onValue) {
    //       myIcon = onValue;
    //     });
    // addMarker("Test",current);
  }
  late GoogleMapController mapController;
  final Completer<GoogleMapController> controllerMap = Completer();
   LatLng current = const LatLng(20.98309121380638,  105.80134688698458);
    CameraPosition kGooglePlex =  const CameraPosition(
      target: LatLng(20.98309121380638, 105.80134688698458),
      zoom: 14.4746,
  );
    Map<String, Marker> marker = {};
 // Marker? markerrr = Marker(markerId: "Testttt");
  BitmapDescriptor? myIcon;
  Future<BitmapDescriptor> loadIcon()  async
  {
    BitmapDescriptor icons = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(size: Size(48, 48)), "assets/img/map.png");
    return icons;
  }
  addMarker(String id,LatLng location) async
  {
    var maker = Marker(
        markerId:  MarkerId(id),
        position: location,
        infoWindow: const InfoWindow(title: "Vị trí của bạn", snippet: "Bạn có tìm kiếm các thợ xung quanh"),
        icon: await loadIcon()
    );
    marker[id] = maker;
    //markerrr = maker;
  }

}
