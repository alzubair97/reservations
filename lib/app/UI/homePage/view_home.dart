import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservations/app/UI/cars/view_car.dart';
import 'package:reservations/app/UI/homePage/controller/controller.dart';
import 'package:reservations/app/UI/homePage/hotel/controller_hotel.dart';
import 'package:reservations/app/UI/homePage/hotel/view_hotel.dart';
import 'package:reservations/app/core/theme/color.dart';
import 'package:reservations/app/core/theme/helper_change_app_theme.dart';
import 'package:reservations/app/global_widgets/change_language.dart';
import 'package:reservations/app/global_widgets/text/text_view.dart';
import 'package:reservations/style/color.dart';
import 'package:reservations/app/global_widgets/change_language.dart';
import 'package:reservations/app/core/theme/helper_change_app_theme.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:sizer/sizer.dart';
class Home extends StatelessWidget {
  final controller = Get.put(ControllerHome(), permanent: true);
  final controller1 = Get.put(ControllarHotel(), permanent: true);

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const defaultDuration = Duration(milliseconds: 250);
    final List<Widget> _list = <Widget>[
      ViewHotel(),
    ViewHotel(),
      ViewCar(),
      Pages(
        text: "  ماهي جهتك",
        color: Colors.red.shade100,
      ),
      // Center(
      //     child: Pages(
      //       text: "Page Three",
      //       color: Colors.grey,
      //     )),
      // Center(
      //     child: Pages(
      //       text: "Page Four",
      //       color: Colors.yellow.shade100,
      //     ))
    ];
    return DefaultTabController(
      length: 4,
      child: Container(
          color: context.theme.backgroundColor,
          child: Scaffold(
            // appBar: AppBar(backgroundColor: LightColor.primaryColorLight,
            //  title:  Text("حجوزاتي",
            //       style: Theme
            //           .of(context)
            //           .textTheme
            //           .headline6!
            //           .copyWith(fontWeight: FontWeight.bold,color: foreignColor)
            //     // style:  Get.textTheme.headline6!.copyWith(fontWeight: FontWeight.bold),
            //   ),foregroundColor: Colors.white,
            //   centerTitle:true ,
            //   actions: [
            //     const IconButton(
            //       icon: Icon(
            //         MaterialCommunityIcons.theme_light_dark,
            //       ),
            //       onPressed: ThemeService.switchTheme,
            //     ),
            //     IconButton(
            //         icon: const Icon(Icons.language,
            //         ),
            //         onPressed: () => CustomChangeLanguage().showLanguage()
            //     ),
            //   ],
            //   titleSpacing: 0,
            //
            // ),
            body: Column(children: [
              Container(
                color: LightColor.primaryColorLight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 5, top: 2, bottom: 2),
                  child: TabBar(
                    indicatorWeight: 0,
                    unselectedLabelColor: Colors.white,
                    labelColor: Colors.white,
                    indicator: BoxDecoration(
                        color: Colors.white,
                        //backgroundBlendMode: BlendMode.screen,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                        border: Border.all(
                          width: 1,
                          color: Colors.white,
                        )
                        // border:
                        ),
                    tabs: const [
                      Tab(
                          //icon: Icon( Icons.all_inbox,color: Colors.black,)
                          child: CustomText(
                        text: "فنادق",
                      )),
                      Tab(
                        //text: "طلبات قيد التجهيز",
                        child: CustomText(text: "استراحات"),
                        //icon: Icon( Icons.check,color: Colors.black,)
                      ),
                      Tab(
                        //icon: Icon( Icons.access_time_outlined,color: Colors.black,)
                        child: CustomText(text: "سيارات"),
                      ),
                      Tab(
                        //icon: Icon(Icons.subway,color: Colors.black,)
                        child: CustomText(text: "كوش اعراس"),
                      ),
                    ],
                  ),
                ),
              ),
              //
              // Container(height: 50,width: Get.width,
              //   color:   LightColor.primaryColorLight,
              //   child:  ListView.builder(
              //       shrinkWrap: true,
              //       scrollDirection: Axis.horizontal,
              //       itemCount:controller.ListType.length,
              //       itemBuilder: (BuildContext context, index) {
              //         return GestureDetector(
              //             onTap: () {
              //               controller.selected(index);},
              //           child: Obx(() =>
              //              GestureDetector(onTap: () {
              //
              //              },
              //                child: AnimatedContainer(
              //                 duration: defaultDuration,
              //                 height: 20,
              //                 width: 60,margin:  EdgeInsets.all(2),
              //                  padding: EdgeInsets.all(2),
              //                 decoration: BoxDecoration(
              //                   color:  controller.selectedImage.value == index ? Color(0xFFF6F7F9):LightColor.primaryColorLight,
              //
              //                   borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10),bottomRight: Radius.circular(10)),
              //                   // border: Border.all(
              //                   //     color:  Colors.red.withOpacity(controller.selectedImage.value == index ? 1 : 0)),
              //                 ),child:  Text(
              //                 controller.ListType[index],
              //                 style: Get.textTheme.headline6!.copyWith(color: Colors.black),
              //             ),
              //             ),
              //              ),
              //           ),
              //         );
              //       })
              //   ),
              //   Flexible(
              //     child: PageView(
              //       allowImplicitScrolling: true,
              //       children: _list,
              //       scrollDirection: Axis.horizontal,
              //       onPageChanged: (num) {
              //         print("object"+num.toString());
              //       },
              //     ),
              //   ),
              Flexible(
                flex: 3,
                child: TabBarView(children: _list),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  CustomText(text: "افضل الفنادق",txSize: 9.sp,txClr:  LightColor.primaryColorLight,),
                  Icon(Icons.navigate_next)
                ],),
              ),
              Flexible(
                  child: ListView.builder(scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(right: 5,bottom: 2),
                    itemCount: controller1.cardlist.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width:Get.width/2.8 ,
                        child: Card(margin: EdgeInsets.only(left: 5),
                          child: Padding(
                            padding: EdgeInsets.only(right: 5,),
                        child: Column(mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Image.asset(
                        height: 50,
                        width: Get.width,fit: BoxFit.contain,
                                controller1.cardlist[index].imge),
                            CustomText(
                                text: controller1.cardlist[index].title),
                            CustomText(txClr:  LightColor.primaryColorLight,
                                text: controller1.cardlist[index].adress,)
                          ])),
                        ),
                      );
                    },
                  )),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: "افضل الاستراحات",txSize: 9.sp,txClr:  LightColor.primaryColorLight,),
                    Icon(Icons.navigate_next)
                  ],),
              ),

              Flexible(
                  child: ListView.builder(scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(right: 5,bottom: 2),

                    itemCount: controller1.spacelist.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                          width:Get.width/2.8 ,
                          child: Card(margin: EdgeInsets.only(left: 5),
                        child: Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Column(mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Image.network(
                                height: 50,
                                width: Get.width/2,fit: BoxFit.fill,
                                controller1.spacelist[index].imge),
                            CustomText(
                                text: controller1.spacelist[index].title),
                            CustomText(txClr:  LightColor.primaryColorLight,
                                text: controller1.spacelist[index].adress,)
                          ]),
                        )),
                      );
                    },
                  )),
            ]),
          )),
    );
  }
}

class Pages extends StatelessWidget {
  final text;
  final color;

  Pages({this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Row(
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              color: Colors.grey.shade200,
              child: const Text(
                "صنعاء",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
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
            decoration: InputDecoration(
                // floatingLabelBehavior: FloatingLabelBehavior.always,

                // labelText: textHint,
                hintText: "بحث عن...."),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "من تاريخ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        color: Colors.grey.shade200,
                        child: const Text(
                          "2023/5/30",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Text(
                        "الي تاريخ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        color: Colors.grey.shade200,
                        child: const Text(
                          "2023/5/30",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
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
                  ),
                  const SizedBox(
                    height: 5,
                  ),
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
          ],
        ),
      ]),
    );
  }
}
