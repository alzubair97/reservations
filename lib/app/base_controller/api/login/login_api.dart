import 'package:get/get.dart';
import 'package:reservations/app/core/contracts/controller.dart';
import 'package:reservations/app/core/utils/masks.dart';
import 'package:reservations/app/data/service.dart';
import 'package:reservations/app/data/url_path.dart';
import 'package:reservations/app/routes/routes.dart';
import 'package:reservations/langange/string.dart';
import 'package:reservations/app/global_widgets/snakbar/erorr.dart';

class LoginApi extends ControllerClass {
   loginApiFun(
      {required String phoneNumber,
      required String pass,
      required RxBool isLoading}) {
    isLoading(true);
    ServiceAPI(url: AppUrl.login, dataSend:{
      "UUID":"f04503f4cdac42e6",
      "MobileNo":phoneNumber,
      "accessType":"a_n",
      "login_UserId":phoneNumber,
      "User_Password":pass,
      "Lang_Id":1,
      "serUpdVers":"44",
      "confirm":"88",
      "aapV":"4.2"
    }).postData(onSuccess: (success) {
        AppMasks.token = success[1]['jwt'].toString();
        AppMasks.clientKey = success[1]['clientKey'].toString();
        AppMasks.uniqKey = success[1]['uniqKey'].toString();
        AppMasks.userType = success[0]["userType"].toString();
        AppMasks.phoneNumber = phoneNumber;
        AppMasks.profile.fullName = 'hassan alsabahi';
        AppMasks.profile.userName = '770230704';
        AppMasks.profile.imageUrl = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCLiuXGOPW9iS7SxWlKsUDw80E0f7aN7f37w&usqp=CAU';
        AppMasks.profile.email = 'hassan@gmail.com';
        AppMasks.pass = pass;
        isLoading(false);
        Get.offAllNamed(Routes.home);
    }, onError: (error) {
      isLoading(false);
      try {
        showSnakBarError(msg: error.toString());
      } catch (e) {
        showSnakBarError(msg: error.toString());
      }
    }, onRunTime: () {
      isLoading(false);
      showSnakBarError(msg: TranslateText.unKnowError.tr);
    }, noInterNet: () {
      isLoading(false);
      showSnakBarError(msg: TranslateText.noNetFond.tr);
    });
  }
}
