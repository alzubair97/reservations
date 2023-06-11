abstract class LocalStorage {
  String get keyStore;
  saveLocal({required Map<String, dynamic> data});
  Future<dynamic> getLocal();
  deleteLocal();
}