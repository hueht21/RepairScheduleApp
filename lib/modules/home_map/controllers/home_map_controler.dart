import 'dart:async';
import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class HomePageControl extends GetxController {
  RxDouble latitude = 20.99213800591695.obs;// chawd lầ bạn đẻ 0 nên là no troi về bên nào r ấy haha
      // 20.99213800591695.obs; // đây bạn/, đây la mình fix cứng
  RxDouble longitude = 105.81020471504765.obs;
      // 105.81020471504765.obs;
  var address = 'Getting address..'.obs;
  late StreamSubscription<Position> streamSubscription;
late BitmapDescriptor icon;
  late BitmapDescriptor iconRepair;

  @override
  void onInit() async {
    super.onInit();
    await loadIcon();
    await loadIconRepair();
    await getLocation();
    //getLatitude();
    // await BitmapDescriptor.fromAssetImage(const ImageConfiguration(size: Size(48, 48)), "assets/img/map.png")
    //     .then((onValue) {
    //       myIcon = onValue;
    //     });
    
    log("dayyy ");
  }
// cái hàm này để làm gì, để lấy vị trí của mình ấy // bạn fix cứng rồi mà, sau khi mình gọi
  // ham nay thì 2 gia tri nay nó thay doi ấy bạn, như nó đnag log ra màn hình ấy
  getLocation() async {
    bool serviceEnable;
    LocationPermission permission;
    serviceEnable = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnable){
      await Geolocator.openLocationSettings();
      return Future.error("Location service are disable");
    }
    permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Future.error("Location service are disable");
      }
    }
    if(permission == LocationPermission.deniedForever){
      return Future.error("Location service are disable");
    }
    streamSubscription = Geolocator.getPositionStream().listen((Position position) {
      // đó hình như là mình biết r. Ở đây nó chỉ cập nhật tọa độ chứ không cập nhật cái Marker
      // Giờ mỗi khi tọa độ thay đổi thì phải add thêm cái marker mới vào 

      // bạn thấy cái log không?  Nó update liên tục tức là cái Marker đang được update liên tục
      // đúng rồi. Có vẻ là xong rồi đấy, Bạn đỉnh thực sự =)) , Mình cảm ơn bạn nhiều nhé, đêm hôm rồi mà vẫn còn vất vả giúp mình
      // Không có gì. Giúp người khác cũng học thêm được 1 số thứ, oke để mình tắt hẳn app đi rồi chạy lạii xme
      addMarkerRepair('Test3', LatLng(position.latitude, position.longitude));
      latitude.value = position.latitude;
      longitude.value = position.longitude;
      log("tung do la  + ${latitude.value}"); // còn đây là khi nó lấy được
      getAddressFromLatLang(position);
    });
  }
  Future<void> getAddressFromLatLang(Position position) async {
    List<Placemark> placemark =
    await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];
    address.value = 'Address : ${place.locality},${place.country}';
  }
  late GoogleMapController mapController;
  final Completer<GoogleMapController> controllerMap = Completer();
  RxList<Marker> allMarkers = RxList([]);
  indexMap(double x, double y)
  {
    LatLng current =  LatLng(x, y);
    return current;
  }

  // indexMapUser() async
  // {
  //   LatLng current =  LatLng(await getLatitude(), await getLongitude());
  //   return current;
  // }
  LatLng current2 = const LatLng(20.97902398945378, 105.79489933934353);
  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(20.98309121380638, 105.80134688698458),
    zoom: 14.4746,
  );
  // Map<String, Marker> marker = {};
 //BitmapDescriptor? myIcon;

  


  Future<void> loadIcon() async {
     icon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(68, 68)), "assets/img/mapusericon.png");
    // return icons;
  }
  Future<void> loadIconRepair() async {
     iconRepair = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(68, 68)), "assets/img/repair.png");
    // return icons;
  }

  addMarker(String id, LatLng location)  {
    var maker = Marker(
      markerId: MarkerId(id),
      position: location,
      infoWindow: const InfoWindow(
          title: "Vị trí của bạn",
          snippet: "Bạn có tìm kiếm các thợ xung quanh"),
      icon: iconRepair
    );
   // marker.addAll(maker)
    allMarkers.add(maker);
    // marker[id] = maker;// cai nay ming quen chua xoa di
    //markerrr = maker;
  }
  addMarkerRepair(String id, LatLng local)  {
    var maker = Marker(
        markerId: MarkerId(id),
        position: local,
        infoWindow: const InfoWindow(
            title: "Vị trí của bạn",
            snippet: "Bạn có tìm kiếm các thợ xung quanh"),
        icon: icon
    );
    // marker.addAll(maker)
    allMarkers.add(maker);
    // marker[id] = maker;
    //markerrr = maker;
  }

  // Future<double> getLatitude() async {
  //   double x = await double.parse(latitude.value);
  //   return x
  // }

}
