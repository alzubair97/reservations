import 'package:flutter/material.dart';
import 'package:reservations/app/global_widgets/costom_textfrom_filed.dart';

class CoustomDate extends StatelessWidget {
  GestureTapCallback? onTap;
  TextEditingController txtController;
  FormFieldValidator? validator;
  String txt;
   CoustomDate({Key? key,this.validator,this.onTap,required this.txt,required this.txtController}) ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: TextFromFiled(
        validator:validator,
        enabel: false,
        txt: txt,
        txtController:txtController,
        icon: Icons.date_range_outlined,
      ),
    );
  }
}
