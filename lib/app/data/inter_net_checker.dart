import 'dart:async';
import 'package:get/get.dart';
import 'package:reservations/langange/string.dart';
import 'package:reservations/app/global_widgets/snakbar/erorr.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';

class CheckInterNet extends GetxController {
  RxBool interNet = false.obs;
  late SimpleConnectionChecker simpleConnectionChecker =
      SimpleConnectionChecker()..setLookUpAddress('pub.dev');
  StreamSubscription? subscription;
  @override
  void onInit() async {
    // ignore: todo
    // TODO: implement onInit
    super.onInit();
    subscription =
        simpleConnectionChecker.onConnectionChange.listen((connected) {
      interNet.value = connected;
      Future.delayed(const Duration(seconds: 1), () {
        if (!connected) {
          showSnakBarError(msg: TranslateText.lostInterNet);
        }
      });
    });
  }

  @override
  void onClose() {
    subscription!.cancel();
    super.onClose();
  }
}
