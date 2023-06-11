import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aespack/aespack.dart';

import 'package:reservations/app/global_widgets/buttons/custom.dart';
import 'package:reservations/app/global_widgets/text/input_text.dart';
class EncodingView extends StatelessWidget {
  const EncodingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxString reselt=''.obs;
    RxString text=''.obs;
    RxString iv='1112131415161718'.obs;
    RxString key='1112131415161718'.obs;
    RxBool isLoading=false.obs;
    TextEditingController txtController=TextEditingController();

    return  Scaffold(appBar: AppBar(title: const Text("تشفير  ")),
    body: SingleChildScrollView(
      child: Column(children: [
        const SizedBox(height: 8,),
        CustomTextInput(labelText: "النص المراد تشفيره",onChangeText: (v){
          text.value=v;
        },icon1: Icons.title,),
        const SizedBox(height: 20,),

        CustomTextInput(labelText: "uniqKey",maxLgh: 16,keyboardType: TextInputType.number,withMaxLgh: true,onChangeText: (v){
          key.value=v;
        },icon1: Icons.key,exText: "",),
        CustomTextInput(labelText: "iv",maxLgh: 16,withMaxLgh: true,keyboardType: TextInputType.number,onChangeText: (v){
          iv.value=v.toString();
        },icon1: Icons.onetwothree_sharp,exText: "",),
        Padding(
          padding: const EdgeInsets.only(left: 30.0,right: 30.0),
          child: ActionButton(
              isLoading: isLoading,
              text: 'تشفير',
              onPressed: ()async{
                isLoading.value=true;
                String decryptedString;
                try {
                  reselt.value = await Aespack.encrypt(text.value, key.value, iv.value) ?? '';
                  txtController.text=await Aespack.encrypt(text.value, key.value, iv.value) ?? '';
                  decryptedString = await Aespack.decrypt(reselt.value, key.value, iv.value) ?? 'Failed to decrypt.';
                  isLoading.value=false;
                } on Exception {
                  decryptedString = 'Failed to decrypt.';
                  reselt.value = 'Failed to encrypt';
                  txtController.text = 'Failed to encrypt';
                  isLoading.value=false;
                }
              }),
        ),
        Obx(()=>reselt.value.isNotEmpty?CustomTextInput(textEditingController: txtController,isEnabled: false,maxLin: 2,onChangeText: (v){},icon1: Icons.title,):const SizedBox()),
      ]),
    ),
    );
  }
}
