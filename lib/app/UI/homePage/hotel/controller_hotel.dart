import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ControllarHotel extends GetxController
  {// class controller for Screen Holiday
  var selectedImagePath = ''.obs;
  var selectedImagePathBack = ''.obs;
  var selectedImageSize = ''.obs;
  String? base64string,base64ImageBack ;
  Uint8List? imageBytes,imageBytesBack;
  var isLoading = false.obs;
  final GetStorage _storage = GetStorage();
  late TextEditingController worker, note,

      txtlastdate,
      txtfristdate;
  late Rx<period> selecedTranscation;

  List<period> transcation = [
    period(id: 0, title: 'صنعاء'),
    period(id: 1, title: 'تعز'),
    period(id: 2, title: 'اب'),
    period(id: 3, title: 'ذمار'),
    period(id: 4, title: 'عدن')
  ];
  late DateTime dateTime = DateTime.now();

  late GlobalKey<FormState> globalKeyholiday;
  List<String> periods=[
    'يوم كامل',
    'الفترة الاولى',
    'الفترة الثاني',
    'نص دوام'
  ];
  List<ModelCard>cardlist=[
    ModelCard(id: 0, adress: 'صنعاء شارع تعز', imge:  "assets/image/splash_1.png", title: ' فندق هيلتون'),
    ModelCard(id: 0, adress: 'صنعاء شارع الصافية', imge: "assets/image/logo.png", title: 'فندق حدة'),
    ModelCard(id: 0, adress: 'صنعاء شارع شميلة', imge: "assets/image/logo1.png", title: ' فندق تجيبي'),
  ];
  List<ModelCard>spacelist=[
    ModelCard(id: 0, adress: 'صنعاء شارع التحرير', imge:  "https://ehjjiz.com/public/uploads/0000/1/2021/01/24/royal-crown-sayun-44.jpg", title: ' استراحة الزبير'),
    ModelCard(id: 0, adress: 'صنعاء شارع 22 مايو', imge:"https://ehjjiz.com/public/uploads/0000/1/2021/01/24/royal-crown-sayun-34.jpg", title: 'استراحة مياس '),
    ModelCard(id: 0, adress: 'صنعاء شارع الاصبحي', imge:  "https://ehjjiz.com/public/uploads/0000/1/2021/01/24/royal-crown-sayun-44.jpg", title: ' استراحة تجريبي'),
  ];


  late RxString selPerId;
  //list view holiday type
  @override
  void onInit() {
    globalKeyholiday = GlobalKey<FormState>();
    txtlastdate = TextEditingController();
    note = TextEditingController();
    worker = TextEditingController();
    txtfristdate = TextEditingController();
    selecedTranscation = transcation[0].obs;
    worker.clear();
    note.clear();
    super.onInit();
    selPerId = ''.obs;
    //lastdate = TextEditingController();

    txtfristdate.text = DateFormat('yyyy-MM-dd').format(dateTime);
    txtlastdate.text=DateFormat('yyyy-MM-dd').format(dateTime);
    // selecedindex='نوع الاذن'.obs;
    // changeaitem();
  }
  Future pickDateTime(BuildContext context) async {//get first date to holiday
    await pickDate(context).then((value) {
      var date = DateFormat('yyyy-MM-dd').format(value!);
      txtfristdate.text = date.toString();
    });
  }
  Future picklastDate(BuildContext context) async {//get last date to holiday
    await pickDate(context).then((value) {
      var date = DateFormat('yyyy-MM-dd').format(value!);
      txtlastdate.text = date.toString();
    });
  }
  Future<DateTime?> pickDate(BuildContext context) async {//get date  to holiday
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime
          .now()
          .year - 1),
      lastDate: DateTime(DateTime
          .now()
          .year + 1),
    );
    if (newDate == null) return initialDate;

    return newDate;
  }



  validatcost(String valdatTxt) {
    if (valdatTxt.isEmpty) {
      return "يرجي ادخال البيانات ";
    }
    return;
  }
  void get_image( {ImageSource? imageSource, int? typeImage}) async
  { // view and get image
    // var status = await Permission.camera.status;
    // var status2 = await Permission.storage.status;
    print("Permission ");

    //  if (status.isGranted || status2.isGranted ) {
    print("Permission is granted");
    try{
      final pickedFile = await ImagePicker().pickImage(source: imageSource!, maxHeight: 200);
      //الوجه الامامي للصوره
      if (pickedFile != null && typeImage == 1) {
        selectedImagePath.value = pickedFile.path;
        selectedImageSize.value = ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2) + "MB";
        print("before image = ${pickedFile.path}");
        var imageBytes = File(selectedImagePath.value).readAsBytesSync();
        base64string = base64.encode(imageBytes);

      } //الوجه الخلفي للصوره.
      else if (pickedFile != null && typeImage == 2) {
        selectedImagePathBack.value = pickedFile.path;
        selectedImageSize.value = ((File(selectedImagePathBack.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2) + "MB";
        imageBytesBack = File(selectedImagePathBack.value).readAsBytesSync();
        base64ImageBack = base64.encode(imageBytesBack!) ;
        print("after 00000000000000000000000000");
        print("after image back = ${base64ImageBack.toString()}");
        print("after 00000000000000000000000000");
      }
      print("exxxxxxxxxxx ");

    }catch (ex){
      print(ex.toString());

    }
  }

}
class period  {
  int id;
  String title;

  period({required this.id, required this.title});
}
class ModelCard  {
  int id;
  String title;
  String adress;
  String imge;


  ModelCard({required this.id,required this.adress,required this.imge, required this.title});
}