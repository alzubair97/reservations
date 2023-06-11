import 'package:get_storage/get_storage.dart';
import 'package:reservations/app/core/utils/keys.dart';
import 'package:reservations/app/data/provider/storage_provider.dart';
import 'package:reservations/app/data/models/user.dart';

class GetLocalUser extends LocalStorage {
  var box = GetStorage();
  @override
  // ignore: todo
  // TODO: implement keyStore
  String get keyStore => AppMapKey.userData;

  @override
  saveLocal({required Map<String, dynamic> data}) async {
    await box.write(keyStore, data);
  }

  @override
  Future getLocal() async {
    var data = await box.read(keyStore);
    return data == null ? null : UserModel.fromJson(data);
  }

  Future getLoginModel() async {
    UserModel _login;
    var data = await box.read(keyStore);
    if (data != null) {
      _login = UserModel.fromJson(data);
      return _login.toLoginApi(phone: "", pass: "");
    } else {
      return {};
    }
  }

  @override
  deleteLocal() async {
    await box.write(keyStore, null);
  }
}
