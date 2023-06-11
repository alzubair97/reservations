import 'package:get_storage/get_storage.dart';
import 'package:reservations/app/data/provider/storage_provider.dart';

class TokenLocalStorage extends LocalStorage {
  var box = GetStorage();
  @override
  // ignore: todo
  // TODO: implement keyStore
  String get keyStore => 'AppMapKey.tokenLocalData';
  String get visitorKeyStore => 'AppUrl.getVisitorId';

  @override
  saveLocal({required Map<String, dynamic> data}) async {
    await box.write(keyStore, data);
  }

  saveVisitorLocal({required dynamic data}) async {
    await box.write(visitorKeyStore, data);
  }

  @override
  Future getLocal() async {
    var data = await box.read(keyStore);
    // return await data==null?null:TokenModel.fromJson(await data);
    return await data;
  }

  Future getVisitorLocal() async {
    var data = await box.read(visitorKeyStore);
    return await data ?? '';
  }

  @override
  deleteLocal() async {
    await box.write(keyStore, null);
  }

  deleteVisitorLocal() async {
    box.write(visitorKeyStore, null);
  }
}
