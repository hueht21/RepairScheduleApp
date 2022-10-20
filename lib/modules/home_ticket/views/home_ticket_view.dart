import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repair_schedule_app/modules/home_ticket/controllers/home_ticket_controller.dart';

import '../../../app/utils/font_ui.dart';
import '../../../app/utils/img.dart';

class HomeTicket extends StatelessWidget{
  HomeTicketController controller = Get.put(HomeTicketController());

  @override
  Widget build(BuildContext context) {
    final  viewItem = [vouchersView(context), vouchersUser()];
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text("Vouchers", style: FontStyleHomeTicket.font20W700(),),
              Row(
                children: [
                  const SizedBox(
                    width: 30
                  ),
                  _filterItem(title: "Vouchers mới", index: 0),
                  const Flexible(fit: FlexFit.tight, child: SizedBox()),
                  _filterItem(title: "Vouchers của tôi", index: 1),
                  const SizedBox(
                    width: 30,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Obx(()
                => Container(
                  child: viewItem[controller.checkIndex.value],// cai nay chua hoan thiện
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget _filterItem({required String title, required int index}) {
    // bool isActive = index ==
    //     controller.checkIndex.value; // nếu bằng thì trả về true
    return GestureDetector( // click
      onTap: () => controller.setIndex(index),
      child: Obx(()
        => Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: index == controller.checkIndex.value
                          ? const Color(0xff6B46D6)
                          : const Color(0xff888888),
                      width: 2))),
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            title,
            style: index ==
                controller.checkIndex.value
                ? FontStyleHomeTicket.font16W600().copyWith(
                color: const Color(0xff6B46D6))
                : FontStyleHomeTicket.font16W600(),
          ),
        ),
      ),
    );
  }
  Widget vouchersView(BuildContext context)
  {
    return  Card(
      child: Container(
        width: MediaQuery.of(context).size.width - 30,
        height: 128,
        child: Row(
          children: [
            const SizedBox(
              width: 9,
            ),
            SizedBox(
              height: 94,
              width: 89,
              child: Image.asset(ticket),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Giảm 10% đối với khách hàng có vị trí gần thợ sửa với dưới 2 km từ 12 -10 đến 25 -10", textAlign: TextAlign.left, style: FontStyleHomeTicket.font14W500(),),
                    const SizedBox(
                      height: 6,
                    ),
                    SizedBox(
                      child: Row(
                        children: [
                          Text("Điều kiện áp dụng", style: FontStyleHomeTicket.font12W400(),),
                          const SizedBox(width: 18.92,),
                          Container(
                            height: 40,
                            width: 104,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xff6B46D6)
                            ),
                            child: Center(child: Text("Lưu ngay", style: FontStyleHomeTicket.font16W600().copyWith(color: Colors.white),)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
  Widget vouchersUser()
  {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Center(
          child: Text("Bạn chưa có Vouchers nào", style: FontStyleHomeTicket.font12W400(),),
        ),
      ],
    );
  }
}