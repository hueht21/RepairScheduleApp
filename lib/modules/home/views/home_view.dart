import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:repair_schedule_app/modules/home/controllers/home_controller.dart';
import 'package:repair_schedule_app/modules/home_oder/views/home_oder_view.dart';
import 'package:repair_schedule_app/modules/home_map/views/home_map_view.dart';

import '../../../app/utils/svg.dart';
import '../../home_ticket/views/home_ticket_view.dart';
import '../../home_user/views/home_user_view.dart';

class HomeView extends StatefulWidget {

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeControler controller = Get.put(HomeControler());

  var uid = "";


  @override
  initState()
  {
    super.initState();
    uid  = controller.Uidd[0];
    log("keyyy uid" + uid);
  }


  @override
  Widget build(BuildContext context) {
    final Facment = [HomeMap(), HomeOder(),HomeTicket(), HomeUser()];
    return Obx(() =>
        Scaffold(
            body: Facment[controller.selectIndex.value],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: [
                _bomtomNavi(homesvg, "Trang chủ",
                    controller.selectIndex == 0 ? const Color(0xff6B46D6) : const Color(0xff888888)),
                _bomtomNavi(odersvg, "Đơn đặt",
                    controller.selectIndex == 1 ? const Color(0xff6B46D6) : const Color(0xff888888)),
                _bomtomNavi(ticketnavi, "Vouchers",
                    controller.selectIndex == 2 ? const Color(0xff6B46D6) : const Color(0xff888888)),
                _bomtomNavi(usersvg, "Cá nhân",
                    controller.selectIndex == 3 ? const Color(0xff6B46D6) : const Color(0xff888888))
              ],
              unselectedLabelStyle: const TextStyle(fontSize: 12),
              selectedLabelStyle: const TextStyle(fontSize: 12),
              currentIndex: controller.selectIndex.value,
              selectedItemColor: const Color(0xff6B46D6),
              onTap: controller.setIndex,
            ))
    );
  }

  _bomtomNavi(String icon, String label, Color color) {
    return BottomNavigationBarItem(
        icon: Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: SvgPicture.asset(icon, color: color,)
        ),
        label: label);
  }
}
