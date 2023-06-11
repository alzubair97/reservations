import 'package:flutter/material.dart';
import 'package:reservations/app/core/theme/color.dart';
import 'package:reservations/app/core/theme/text_theme.dart';
import 'package:sizer/sizer.dart';
class TextFromFiled extends StatelessWidget {
  final String txt;
  TextEditingController txtController;
  IconData? icon;
  bool enabel = false;
  FormFieldValidator? validator;
  double? font = 10;
  AutovalidateMode? autovalidateMode;
  TextInputType inputType;

  TextFromFiled(
      {Key? key,
      this.autovalidateMode,
      this.inputType = TextInputType.text,
      required this.txt,
      required this.enabel,
      this.validator,
      required this.txtController,
      this.icon,
      this.font})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white,
      child: TextFormField(
          style: AppTextStyleTheme.inputText,

          controller: txtController,
          enabled: enabel,
          keyboardType:inputType,
          validator:(x)=>x!.isEmpty?'هذا الحقل مطلوب':null,
          autofocus: false,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color:LightColor.primaryColorLight ,
            ),

            labelText: txt,
            // hintStyle: TextStyle(color: Colors.black54, fontSize: font),
            labelStyle: TextStyle(color: Colors.black, fontSize: 10.sp,fontWeight: FontWeight.w300),

         hintStyle: TextStyle(color: Colors.black, fontSize: 7.sp,fontWeight: FontWeight.w400, ),
            contentPadding: EdgeInsets.fromLTRB(0,0.0, 0.0, 0),
            // border: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(
            //       0.0,
            //     ),)
          ))
            // enabledBorder:  OutlineInputBorder(
            //     borderRadius: BorderRadius.all(Radius.circular(0)),
            //     borderSide: BorderSide(color: Colors.grey, width: 1)),
            // focusedBorder:  OutlineInputBorder(
            //     borderRadius: BorderRadius.all(Radius.circular(0)),
            //     borderSide: BorderSide(color: Colors.grey, width: 1)),
            // focusedErrorBorder: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(0)))),



    );
  }
}

class TextFromFiledpass extends StatelessWidget {
  final String txt;
  final IconData? saficxIcon;

  TextEditingController txtController;
  bool enabel = false;
  FormFieldValidator? validator;
  double? font = 10;
  AutovalidateMode? autovalidateMode;
  TextInputType inputType;
  GestureTapCallback? pressedISafixcon;
  bool abstract;


  TextFromFiledpass(
      {Key? key,
      this.autovalidateMode,
      this.inputType = TextInputType.text,
      required this.txt,
      required this.enabel,
      this.validator,
      required this.txtController,
      this.font,
       this.abstract=true,
        this.pressedISafixcon,
        this.saficxIcon,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: txtController,
        enabled: enabel,
        obscuringCharacter: "*",
        obscureText: abstract,
        keyboardType: inputType,
        validator: (x) => x!.isEmpty ? 'هذا الحقل مطلوب' : null,
        autofocus: false,
        decoration: InputDecoration(
          suffixIcon:  IconButton(onPressed: pressedISafixcon, icon: Icon(saficxIcon)),


          // hintText: txt,
          // hintStyle:TextStyle(color:Colors.black,fontSize: font),
          labelText: txt,
          // hintStyle: TextStyle(color: Colors.black54, fontSize: font),
          labelStyle: TextStyle(color: Colors.black, fontSize: 14),

          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
            10.0,
          )),
        )
    );
  }
}
