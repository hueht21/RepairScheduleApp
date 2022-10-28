
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:repair_schedule_app/data/models/RepairSchedule.dart';
import '../../../app/utils/font_ui.dart';
import '../controllers/register_schedule_controller.dart';

class RegisterScheduleView extends StatelessWidget {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail =TextEditingController();
  TextEditingController txtPhone= TextEditingController();
  TextEditingController txtAddress= TextEditingController();
  TextEditingController txtNote= TextEditingController();

  RegisterScheduleController controller = Get.put(RegisterScheduleController());

  void showDate(BuildContext context)
  {
    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2001), lastDate:  DateTime(2222) ,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.orangeAccent,
            ),
          ),
          child: child!,
        );
      },
    ).then((date)
    {
      //obx
      final f = DateFormat('dd-MM-yyyy');
      controller.dateTime.value = f.format(date!);

    });
  }


  String formatTimeOfDay(TimeOfDay tod) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm();  //"6:00 AM"
    return format.format(dt);
  }
  void setTime(BuildContext context) async
  {
    TimeOfDay? newTime = await showTimePicker(context: context, initialTime: controller.time.value);
    //if(newTime == null) return;
    controller.time.value = newTime!;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black, // <-- SEE HERE
        ),
        backgroundColor: Colors.white,
        title: Text("Đăng ký lịch sửa", style: FontStyleRegister.font16W700(),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox(
          child: SingleChildScrollView(
            child: Card(
                margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: _formInput(context)),
          ),
        ),
      ),
    );
  }
  Widget _formInput(BuildContext context)
  {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 15),
          child: Column(
            children: [
              _tagInPut(txtInPut: txtName, nameLable: "Họ và tên", nameInputLable: "Nhập họ và tên", check: 1, context: context),
              const SizedBox(
                height: 15,
              ),
              _tagInPut(txtInPut: txtPhone, nameLable: "Số điện thoại", nameInputLable: "Nhập số điện thoại", check: 1, context: context, isCheck: true),
              const SizedBox(
                height: 15,
              ),
              _tagInPut(txtInPut: txtAddress, nameLable: "Địa chỉ", nameInputLable: "Nhập địa chỉ", check: 1,sizeBox : 1,context: context),
              const SizedBox(
                height: 15,
              ),
              Obx(() => _tagInPut(nameLable: "Ngày tháng", dateTime: "${controller.dateTime}", check: 0, context: context),),

              const SizedBox(
                height: 15,
              ),
              //_tagInPut(nameLable: "Thời gian" , dateTime: formatTimeOfDay(time) , check: 3, context: context),
              Obx(() => _tagInPut(nameLable: "Thời gian" , dateTime: formatTimeOfDay(controller.time.value) , check: 3, context: context),),
              const SizedBox(
                height: 15,
              ),
              _tagInPut(txtInPut: txtNote, nameLable: "Tình trạng hỏng", nameInputLable: "Nhập tình trạng hỏng", check: 1,sizeBox: 1, context: context),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 120,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xff04AA6D),
                        ),
                        onPressed: () async {
                          MaterialLocalizations localizations = MaterialLocalizations.of(context);
                          String formattedTime = localizations.formatTimeOfDay(controller.time.value, alwaysUse24HourFormat: false);
                          DateTime date= DateFormat.jm().parse(formattedTime);
                          String timeDate = DateFormat("HH:mm").format(date);
                          await controller.insertData(RepairSchedule(id: "123", name: txtName.text, address: txtAddress.text, phone: txtPhone.text, note: txtNote.text, time: timeDate, repair: "null", date: "${controller.dateTime}", status: 0));
                          //ScheduleSevice.schSv.creaSchule(Schedule(nameCustomer: txtName.text, dateSchedule: dateTime, dateTime: timeDate , note: txtNote.text, status: 0, email: txtEmail.text, numberPhone: txtPhone.text, address: txtAddress.text));
                          Get.snackbar("Thông báo", "Bạn đã đăng ký thành công");

                        }, child: Text("Đăng ký",style: FontStyleRegister. font15W500()),
                  ),
                  )],
              ),
              const SizedBox(
                height: 35,
              ),

            ],
          ),
        )

      ],
    );
  }
  Widget _tagInPut({required BuildContext context, TextEditingController? txtInPut, String? nameInputLable, required String nameLable, required int check, String? dateTime, int? sizeBox, bool? isCheck = false})
  {
    return Column(
      children: [
        Row(
          children: [
            Text(nameLable , style:  FontStyleRegister.font14W500() ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: sizeBox ==1 ? 60 : 45,
          child:
          check ==1 ? TextField(
            keyboardType: isCheck == true ? TextInputType.number : TextInputType.text,
            controller: txtInPut,
            style: FontStyleRegister.font12W400(),
            decoration: InputDecoration(
              //contentPadding: const EdgeInsets.symmetric(vertical: 25.0),
              border: const OutlineInputBorder(
              ),

              labelText: nameInputLable,
              labelStyle: FontStyleRegister.font12W400(),

            ),
          ) :
          InkWell(
              onTap: () async {
                if(check == 0)
                {
                  showDate(context);
                }
                else
                {
                  setTime(context);
                }

              },
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey,
                        width: 1,
                        style: BorderStyle.solid
                    ),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10,left: 12),
                    child: Text(
                      dateTime!,style: FontStyleRegister.font12W400() ,),
                  )))
        )
      ],
    );
  }
}
