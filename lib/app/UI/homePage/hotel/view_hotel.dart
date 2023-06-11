import 'package:flutter/material.dart';
import 'package:reservations/app/UI/homePage/hotel/controller_hotel.dart';
import 'package:get/get.dart';
import 'package:reservations/app/global_widgets/custom_date.dart';
import 'package:reservations/app/global_widgets/text/text_view.dart';
import 'package:sizer/sizer.dart';

import '../../../core/theme/color.dart';

class ViewHotel extends StatelessWidget {
  ViewHotel({Key? key}) : super(key: key);
  final _controllar = Get.put(ControllarHotel());

  @override
  Widget build(BuildContext context) {
    return Card(elevation: 0.2,
      margin: const EdgeInsets.only(right: 5,left: 5),
      child:
          Padding(
            padding: const EdgeInsets.only(right: 3,left: 3,bottom: 5),
            child: Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Row(children: [
            const Text(
              "ماهي وجهتك",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400,color:  LightColor.primaryColorLight,),
            ),
            const SizedBox(
              width: 20,
            ),
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
        const Divider(),
        Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Row(
              children: const [
                Text(
                  "اسم الفندق",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ],
            ),
        ),
         const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(enabled: false,
                  // floatingLabelBehavior: FloatingLabelBehavior.always,

                  // labelText: textHint,
                  hintText: "بحث عن...."),
            ),
        ),
        const SizedBox(
            height: 5,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  children: [
                    // const Text(
                    //   "من تاريخ",
                    //   textAlign: TextAlign.center,
                    //   style:
                    //       TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    // ),
                    CoustomDate(
                      onTap: () {
                        _controllar.pickDateTime(context);
                      },
                      validator: (value) => _controllar.validatcost(value!),
                      txt: "من تاريخ",
                      txtController: _controllar.txtfristdate,
                    ),
SizedBox(height: 10,),
                    CoustomDate(
                      onTap: () {
                        _controllar.pickDateTime(context);
                      },
                      validator: (value) => _controllar.validatcost(value!),
                      txt: " الي تاريخ",
                      txtController: _controllar.txtfristdate,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10,),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text(
                            "البالغين",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.add_circle_outline),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "1",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.remove_circle_outline_sharp)
                        ],
                      ),SizedBox(height: 10,),

                      Row(
                        children: const [
                          Text(
                            "الاطفال",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.add_circle_outline),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "1",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.remove_circle_outline_sharp)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
        ),
      ]),
          ),
    );
  }
}
