import 'package:flutter/material.dart';
import 'package:reservations/app/UI/homePage/hotel/controller_hotel.dart';
import 'package:get/get.dart';
import 'package:reservations/app/core/theme/color.dart';
import 'package:reservations/app/global_widgets/custom_date.dart';
import 'package:reservations/app/global_widgets/text/text_view.dart';
import 'package:sizer/sizer.dart';


class ViewCar extends StatelessWidget {
  ViewCar({Key? key}) : super(key: key);
  final _controllar = Get.put(ControllarHotel());

  @override
  Widget build(BuildContext context) {
    return Card(elevation: 0.2,
      margin: const EdgeInsets.only(right: 5,left: 5),
      child:
      Padding(
        padding: const EdgeInsets.only(right: 3,left: 3,bottom: 5),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          const Text(
            "ماهي وجهتك",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400,color:  LightColor.primaryColorLight,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
CustomText(text: "من    "),
              Flexible(
                child: Obx(
                      () => DropdownButton<period>(
                    icon: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: const [
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 26,
                            color: Colors.black,
                          ),

                        ],
                      ),
                    ),
                    value: _controllar.selecedTranscation.value,
                    items: _controllar.transcation.map((period value) {
                      return DropdownMenuItem<period>(
                        value: value,
                        child: CustomText(
                          text: value.title.toString(),
                          txClr: Colors.black,
                          txSize: 10.sp,
                          // fontWeight: FontWeight.bold,
                        ),
                      );
                    }).toList(),
                    onChanged: (val) {
                      _controllar.transcation.remove(val);
                      _controllar.transcation.insert(0, val!);
                      // _controllar.id.value=val.id;
                      _controllar.selecedTranscation.value = val;
                      print(val);
                    },
                  ),
                ),
              ),
              SizedBox(width: 100,),
                  CustomText(text: "الي    "),
              Flexible(
                child: Obx(
                      () => DropdownButton<period>(
                    icon: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: const [
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 26,
                            color: Colors.black,
                          ),

                        ],
                      ),
                    ),
                    value: _controllar.selecedTranscation.value,
                    items: _controllar.transcation.map((period value) {
                      return DropdownMenuItem<period>(
                        value: value,
                        child: CustomText(
                          text: value.title.toString(),
                          txClr: Colors.black,
                          txSize: 10.sp,
                          // fontWeight: FontWeight.bold,
                        ),
                      );
                    }).toList(),
                    onChanged: (val) {
                      _controllar.transcation.remove(val);
                      _controllar.transcation.insert(0, val!);
                      // _controllar.id.value=val.id;
                      _controllar.selecedTranscation.value = val;
                      print(val);
                    },
                  ),
                ),
              ),
            ]),
          ),
          const Divider(),

          const SizedBox(
            height: 5,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: CoustomDate(
                  onTap: () {
                    _controllar.pickDateTime(context);
                  },
                  validator: (value) => _controllar.validatcost(value!),
                  txt: "من تاريخ",
                  txtController: _controllar.txtfristdate,
                ),
              ),
              SizedBox(width: 5,),
              Flexible(
                child: CoustomDate(
                  onTap: () {
                    _controllar.pickDateTime(context);
                  },
                  validator: (value) => _controllar.validatcost(value!),
                  txt: " الي تاريخ",
                  txtController: _controllar.txtfristdate,
                ),
              ),

            ],
          ),
        ]),
      ),
    );
  }
}
