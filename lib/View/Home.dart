import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:repair_schedule_app/Controller/HomeControler.dart';
import 'package:repair_schedule_app/View/HomeOder.dart';
import 'package:repair_schedule_app/View/HomePage.dart';

import '../Utils/svg.dart';
import 'HomeUser.dart';

class Home extends StatelessWidget {
  final Facment = [HomePage(), HomeOder(), HomeUser()];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControler>(
        init: HomeControler(),
        builder: (controller) {
          return Scaffold(
              body: Facment[controller.selectIndex],
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: [
                  _bomtomNavi(homesvg,"Trang chủ",controller.selectIndex ==0 ? Colors.orange : Colors.black),
                  _bomtomNavi(odersvg,"Đơn đặt",controller.selectIndex ==1 ? Colors.orange : Colors.black),
                  _bomtomNavi(usersvg,"Tài khoản",controller.selectIndex ==2 ? Colors.orange : Colors.black)

                ],
                unselectedLabelStyle: const TextStyle(fontSize: 12),
                selectedLabelStyle: const TextStyle(fontSize: 12),
                currentIndex: controller.selectIndex,
                selectedItemColor: Colors.amber[800],
                onTap: controller.setIndex,
              ));
        });
  }

  _bomtomNavi(String icon, String label,Color color) {
    return BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: SvgPicture.asset(icon,color: color,)
        ),
        label: label);
  }
}
