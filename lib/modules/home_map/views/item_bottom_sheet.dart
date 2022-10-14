import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../app/utils/font_ui.dart';
import '../../../app/utils/img.dart';
import '../../../app/utils/svg.dart';
class ItemRepairView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 330,
        //color: Colors.white,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child:Column(
          children: [
            const SizedBox(
              height: 15,
            ),
              Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Thông tin thợ sửa", style: FontStyleHomeMap.font20BoldP(),),
                        ],
                      )),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                      child: SvgPicture.asset(close_bottom)),
                  const SizedBox(
                    width: 15,
                  ),

                ],
              ),// Thông tin baner
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10,right: 10),
              child: Divider(
                color: Color(0xffEEEEE1),
              ),
            ),
            const SizedBox(height: 10,),
            _inforRepair(context),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 15,),
                Text("Địa chỉ : 111- Xuân hoà - Cầu giấy - Hà nội",style: FontStyleHomeMap.font13W200(),),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 15,),
                Text("Kinh nghiệm làm việc : 6 năm",style: FontStyleHomeMap.font13W200(),),
              ],
            )
          ],
        )
    );
  }
  Widget _inforRepair(BuildContext context)
  {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 10,),
          SizedBox(
              width: 80,
              height: 80,
              child: Image.asset(user_bottom)),
          const SizedBox(width: 12,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Đinh Việt Anh", style: FontStyleHomeMap.font20BoldP().copyWith(fontWeight: FontWeight.w400),),
                const SizedBox(height: 2,),
                Row(
                  children: [
                    Text("0376929500",style: FontStyleHomeMap.font15(),),
                    const Flexible(fit: FlexFit.tight, child: SizedBox()),
                    SizedBox(
                        height: 26,
                        width: 26,
                        child: Image.asset(messages)),
                    const SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset(phone_bottom)),
                    const SizedBox(
                      width: 25,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    for(int i =0;i<=3; i++)
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: SizedBox(
                            width: 16,
                            height: 16,
                            child: Image.asset(star_bole)),
                      ),
                    SizedBox(
                        width: 19,
                        height: 19,
                        child: SvgPicture.asset(starbll))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

}