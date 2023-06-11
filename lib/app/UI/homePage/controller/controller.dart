import 'package:get/get.dart';
class ControllerHome extends GetxController {
  List<String> ListType=[
    'فنادق',
    'سيارات',
    "منتزهات"
  ];
  RxInt selectedImage=0.obs;

  selected(index){
    selectedImage.value = index;
  }

  @override
  void onClose() {

  }

  @override
  void onReady() {

  }

  @override
  void onInit() {

  }
}