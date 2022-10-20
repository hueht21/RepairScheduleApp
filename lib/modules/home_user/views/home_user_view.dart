import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:repair_schedule_app/app/utils/font_ui.dart';
import 'package:repair_schedule_app/app/utils/img.dart';
import 'package:repair_schedule_app/app/utils/svg.dart';
import 'package:repair_schedule_app/modules/home_map/views/home_map_view.dart';

class HomeUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(statusBarColor: Colors.white,
              systemNavigationBarColor: Color.fromRGBO(143, 148, 251, 1),
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarIconBrightness: Brightness.dark,),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  color: const Color(0xffF4F4F4),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Positioned(
                              child: Image.asset(backgrouduser)
                          ),
                          Positioned(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 40,
                                    left: 15),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 285,
                                      height: 45,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              40)
                                      ),
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 14,
                                          ),
                                          SvgPicture.asset(search,
                                            color: const Color(0xff574B78),),
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          Text("Tìm kiếm gì đó ...",
                                            style: FontStyleHomeUser
                                                .font12W400(),),
                                          const Flexible(fit: FlexFit.tight,
                                              child: SizedBox()),
                                          SvgPicture.asset(
                                            sortuser, color: Colors.black,),
                                          const SizedBox(
                                            width: 11,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                        child: HomeMap().optionCircle(width: 44,
                                            height: 44,
                                            icon: messengeruser)
                                    )
                                  ],
                                ),
                              )),
                          Positioned(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 150),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Container(
                                        width: 106,
                                        height: 106,
                                        child: Image.asset(useruser),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 11,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Text("Tô Vũ Ngọc Linh",
                                          style: FontStyleHomeUser
                                              .font20W700(),),
                                        const SizedBox(
                                          width: 5.3,
                                        ),
                                        SvgPicture.asset(editname)
                                      ],
                                    ),
                                    Text("ngoclinh123@gmail.com",
                                      style: FontStyleHomeUser.font15W400(),)
                                  ],
                                ),
                              )
                          ),
                          Positioned(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 380),
                                child: Center(
                                   child: _panerOption(icon1: usersvg, name1 :"Thông tin cá nhân", icon2: payuser, name2: "Thanh toán")
                                ),
                              )
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      _panerOption(icon1: setting, name1 :"Cài đặt", icon2: help, name2: "Trợ giúp", icon4: logout, name4: "Đăng xuất")

                    ],
                  ),
                ),
              ),
            )));
  }

  Widget _panerOption({required String icon1,required String name1 ,required String icon2,required String name2,String? icon4,String? name4 }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        width:  346,
        height: icon4 != null ? 172 : 112,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){
                if(icon1 == usersvg){
                  Get.snackbar("Thông báo", "Vào trang quản lý thông tin");
                }
                else if(icon1 == setting){
                  Get.snackbar("Thông báo", "Vào trang Cài đjăt");
                }
              },
                child: itemOption(icon: icon1, name: name1)),
            const Divider(
              color: Color(0xffF3F3F9),
            ),
            itemOption(icon: icon2 , name: name2),
            if(icon4 != null)
              const Divider(color: Color(0xffF3F3F9),),
            if(icon4 != null)
              InkWell(
                onTap: (){
                  Get.snackbar("Thông báo", "Vào trang đăng xuất");
                  Get.offAllNamed("/login");
                },
                  child: itemOption(icon: icon4 , name: name4!)),
          ],
        ),
      ),
    );
  }
  Widget itemOption({required String icon,required String name})
  {
    return Container(
      height: 40,
      child:Row(
        children: [
          const SizedBox(
            width: 18,
          ),
          SvgPicture.asset(icon, width: 20,
            height: 20,
            color: const Color(0xff574B78),),
          const SizedBox(
            width: 19,
          ),
          Text(
            name, style: FontStyleHomeUser.font16W600(),),
          const Flexible(fit: FlexFit.tight, child: SizedBox()),
          SvgPicture.asset(nextuser),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }
}
