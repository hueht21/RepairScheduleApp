import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:repair_schedule_app/app/utils/font_ui.dart';
import 'package:repair_schedule_app/app/utils/img.dart';
import 'package:repair_schedule_app/data/models/repair.dart';
import 'package:repair_schedule_app/modules/home/controllers/home_controller.dart';
import 'package:repair_schedule_app/modules/home_map/controllers/home_map_controler.dart';

import '../../../app/utils/svg.dart';

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
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                viewSearchNotifications(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 15.21,
                      height: 46,
                    ),
                    _viewOption(color: 0xff6B46D6, name: "Đặt lịch thợ sửa", icon: repairbook),
                    const SizedBox(
                      width: 21,
                    ),
                    _viewOption(color: 0xff6DB2DE, name: "Chuyển đồ", icon: truckcar)
                  ],
                ),
                const SizedBox(
                  height: 20.21,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 24,
                    ),
                    _iconNameOption(name: "Thợ sửa", icon: listRepair),
                    const SizedBox(
                      width: 37,
                    ),
                    _iconNameOption(name: "Trải nghiệm", icon: experience),
                    const SizedBox(
                      width: 37,
                    ),
                    _iconNameOption(name: "Ưu đãi", icon: ticketnavi, check: 1),
                    const SizedBox(
                      width: 37,
                    ),
                    _iconNameOption(name: "Thuê xe", icon: carbus, check: 1)
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.21,right: 13.79,left: 15.21,bottom: 20),
                  child: Divider(
                    color: Color(0xff888888),
                  ),
                ),
                Row(
                  children:  [
                    const SizedBox(
                      width: 15,
                    ),
                    Text("Địa điểm thợ sửa ", style: FontStyleHomeMap.font16W700(),),
                    const Flexible(fit: FlexFit.tight, child: SizedBox()),
                    Text("Xem thêm ", style: FontStyleHomeMap.font16W700(),),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width -15,
                    height: 200,
                    child: Obx(() {
                      //log("co duoc update hay khong");
                      return GoogleMap(
                        mapType: MapType.normal, // thể loại bản đồ , địa hình
                        markers: Set<Marker>.of(controller.allMarkers),
                        initialCameraPosition: controller.kGooglePlex,
                        onMapCreated: (GoogleMapController control) async {
                          controller.controllerMap.complete(control);
                          await controller.getDataRepair();



                          for(Repair i in controller.list) {
                            controller.addMarkerRepair(
                                "${i.id}",
                                controller.indexMap(
                                    i.latitude, i.longitude),i);
                          }
                          //
                          controller.addMarker(
                              "Test3",
                              controller.indexMap(
                                  controller.latitude.value,
                                  controller.longitude
                                      .value));
                          log(" so lương trong list ${controller.list.length}");


                        },
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _iconNameOption({required String name,required String icon, int? check})
  {
    return SizedBox(
      width: 54,
      height: 76,
      child: Column(
        children: [
          optionCircle(width: 54, height: 54, icon: icon, check: check),
          const SizedBox(
            height: 6,
          ),
          Text(name, style: FontStyleHomeMap.font10W500(),)
        ],
      ),
    );
  }
  // Widget viewMap() {
  //   return GoogleMap(
  //     mapType: MapType.normal, // thể loại bản đồ , địa hình
  //     markers: Set<Marker>.of(controller.allMarkers),
  //     initialCameraPosition: controller.kGooglePlex,
  //     onMapCreated: (GoogleMapController control) async {
  //       await controller.getDataRepair();
  //       controller.controllerMap.complete(control);
  //       controller.addMarker(
  //           "Test3",
  //           controller.indexMap(
  //               controller.latitude.value,
  //               controller.longitude
  //                   .value));
  //       log(" so lương trong list ${controller.list.length}");
  //
  //       for(Repair i in controller.list) {
  //         controller.addMarkerRepair(
  //             "${i.id}",
  //             controller.indexMap(
  //                 i.latitude, i.longitude),i);
  //       }
  //     },
  //   );
  // }
  Widget viewSearchNotifications() {
    return Row(
      children: [
        const SizedBox(
          width: 15.21,
          height: 46,
        ),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40)
          ),
          child: SizedBox(
            height: 46,
            width: 282,
            child: Row(
              children: [
                const SizedBox(
                  width: 14,
                ),
                SizedBox(
                    height: 24,
                    width: 24,
                    child: SvgPicture.asset(search)),
                const SizedBox(
                  width: 11,
                ),
                Text("Tìm kiếm", style: FontStyleHomeMap.font12W400(),),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 18,
        ),
        optionCircle(width: 46, height: 46, icon: notification)
      ],
    );
  }
  Widget optionCircle({required double width, required double height,required String icon, int? check}) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.09),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
            color: Colors.orange,
            shape: BoxShape.circle
        ),
        child: CircleAvatar(
            backgroundColor: Colors.white,
            child: check ==1 ? SvgPicture.asset(icon,color: const Color(0xff6B46D6),) : SvgPicture.asset(icon)
        )
    );
  }
  Widget _viewOption({required int color, required String name, required String icon}) {
    return Container(
          width: 166,
          height: 96,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color(color),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: SvgPicture.asset(icon),
              ),
              const SizedBox(
                height: 9.25,
              ),
              Text(name, style: FontStyleHomeMap.font16W600(),)

            ],
          ),
        );
  }
}
