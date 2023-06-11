
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomRaisedButton {
  Widget custom_raised_button({
    color,
    onpressed,
    String? invoicesType,
    Widget? btnChild,
    double paddingVlue = 15.0,
    double width = double.infinity,
    BuildContext? context,
  }) {
    return Padding(
      padding: EdgeInsets.all(paddingVlue),
      child: InkWell(onTap: invoicesType == "returnInvoiceWithInvoice" ? null : onpressed,
        child: Container(
            width: width,
            decoration:  BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),)
            ),
            child: Padding(
              padding: EdgeInsets.all(3.w),
              child: btnChild,
            )),
      ),
    );
  }
}

// class CustomFloatingButton {
//   Widget custom_button({
//     color,
//     onpressed,
//     Widget? btnChild,
//     double width = double.infinity,
//     BuildContext? context,
//   }) {
//     return Container(
//         margin: EdgeInsets.zero,
//         padding: EdgeInsets.zero,
//         color: mainColor,
//         height: 5.h,
//         child: SizedBox(
//             width: width,
//             child: RaisedButton(
//               onPressed: onpressed,
//               child: Padding(
//                 padding: EdgeInsets.all(3.w),
//                 child: btnChild,
//               ),
//               color: mainColor,
//             )));
//   }
// }
