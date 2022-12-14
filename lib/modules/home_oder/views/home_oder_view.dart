
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:repair_schedule_app/data/models/RepairSchedule.dart';
import 'package:repair_schedule_app/modules/home_oder/controllers/home_oder_controller.dart';
import '../../../app/utils/font_ui.dart';

class HomeOder extends StatelessWidget {
  List<String> listItem = ["Đang chờ", "Đã đặt", "Hoàn thành", "Đã huỷ"];
  final HomeOderController controller = Get.put(HomeOderController());



  @override
  Widget build(BuildContext context) {
    final viewList = [listWaiting() , listBook() , listFinish(), listCance()];
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white10,
          systemNavigationBarColor: Color.fromRGBO(143, 148, 251, 1),
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "Đơn đặt của bạn",
                    style: FontStyleHomeOder.font20W700(),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                _listMenu(context),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10.2,
                    ),
                    Text("Danh sách đơn" , style: FontStyleHomeOder.font20W700(),),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                // pát vao day
                Obx(()
                  => Expanded(
                    child: viewList[controller.index.value] // paste vào đây

                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemViewListWaiting(BuildContext context, RepairSchedule repairSchedule) {
     return SizedBox(
       width: MediaQuery.of(context).size.width -12,
       height: 145,
       child: Card(
         child: Column(
           children: [
             const SizedBox(
               height: 10,
             ),
             Row(
               children: [
                 const SizedBox(
                   width: 20,
                 ),
                 Text(repairSchedule.name, style: FontStyleHomeOder.font16W700(),),
                 const SizedBox(
                   width: 20,
                 ),
                 Text(repairSchedule.phone, style: FontStyleHomeOder.font14W500(),),
               ],
             ),
             const SizedBox(
               height: 9,
             ),
             Row(
               children: [
                 const SizedBox(
                   width: 20,
                 ),
                 Text(repairSchedule.time, style: FontStyleHomeOder.font14W500(),),
                 const SizedBox(
                   width: 20,
                 ),
                 Text(repairSchedule.date, style: FontStyleHomeOder.font14W500(),),
               ],
             ),
             const SizedBox(
               height: 9,
             ),
             Row(
               children: [
                 const SizedBox(
                   width: 20,
                 ),
                 Text(repairSchedule.address, style: FontStyleHomeOder.font14W500(),),
               ],
             ),
             const SizedBox(
               height: 9,
             ),
             Row(
               children: [
                 const SizedBox(
                   width: 20,
                 ),
                 Text(repairSchedule.note, style: FontStyleHomeOder.font14W500(),),
               ],
             ),
           ],
         ),
       ),
     );
  }

  Widget _listMenu(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      width: MediaQuery.of(context).size.width,
      height: 30,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listItem.length,
          itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
              controller.setIndex(index);
            },
            child: _itemMenu(listItem[index],index)
        );
      }),
    );
  }

  Widget _itemMenu(String name,int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Obx( ()
        => Container(
          height: 30,
          width: 100,
          decoration: BoxDecoration(
              color: index == controller.index.value ? const Color(0xff6B46D6) : Colors.white,
              borderRadius: BorderRadius.circular(20)),
          child: Center(
              child: Text(
                name,
                style: FontStyleHomeOder.font12W500().copyWith(color: index == controller.index.value ?Colors.white : Colors.black),
              )),
        ),
      ),
    );
  }
  Widget listWaiting()
  {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: controller.listRepairSchedule.length,
        itemBuilder: (context, index) {
          if (index != hashCode) {
            return _itemViewListWaiting(
                context, controller.listRepairSchedule[index]);
          }
          else {
            return const Text("Bạn chưa có đơn đang chờ nào");
          }
        }
    );
  }
  Widget listBook()
  {
    return Center(
      child: Text("Chưa có đơn hàng nào", style: FontStyleHomeOder.font14W500(),),
    );
  }
  Widget listFinish()
  {
    return Center(
      child: Text("Chưa có đơn hàng nào", style: FontStyleHomeOder.font14W500(),),
    );
  }
  Widget listCance()
  {
    return Center(
      child: Text("Chưa có đơn hàng nào", style: FontStyleHomeOder.font14W500(),),
    );
  }
}
