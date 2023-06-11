import 'package:get/get.dart';
import 'package:reservations/app/base_controller/local_storage/user_storage.dart';
import 'package:reservations/app/core/theme/helper_change_app_theme.dart';
import 'package:reservations/app/data/models/list_model.dart';
import 'package:reservations/app/data/models/user_data_account.dart';
import 'package:reservations/app/global_widgets/custom_dailog.dart';
import 'package:reservations/app/routes/routes.dart';
import 'package:reservations/langange/string.dart';

class ProfileController extends GetxController with StateMixin<UserDataAccount> {
  late Rx<List<ListModel>> cityLst;
  @override
  void onInit() {
    super.onInit();
    cityLst = RxList<ListModel>.empty(growable: true).obs;
    // GetCountryListApi.getCountry(list:cityLst);
    change(
       UserDataAccount(
            name: ' ',
            mobile: '770230704',
            idCardNumber: '01010122033',
            cityId: 21,
            adderss: ' حدة شارع صخر',
            img:'https://i.pinimg.com/originals/b3/a8/c1/b3a8c19938060b8a81ed1a7a85831c53.jpg',
            userTypeAsString: 'مدير تطبيق'),
        status: RxStatus.success());
  }

  changeTheme() async {
    ThemeService.switchTheme();
  }

  getUserProfileFun() {}
  goToEditIdCardFun() {
    // Get.toNamed(Routes.editIdCard);
  }
  goToChangPasswordFun() {
    // Get.toNamed(Routes.changePassword);
  }

  exitAccountFun() {
    CustomDialog.deleteWarningDialog(title: TranslateText.exitAccountMsg.tr ,deleteFun: () async{
      await GetLocalUser().deleteLocal();
        Get.offAllNamed(Routes.login);
    });
  }

  deleteAccountFun() {
  }
}
