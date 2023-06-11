import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reservations/app/data/provider/storage_provider.dart';

class UserSelectedLanguageStorage extends LocalStorage {
  final GetStorage _box = GetStorage();
  @override
  // ignore: todo
  // TODO: implement keyStore
  String get keyStore => 'languageSelected';

  @override
  saveLocal({required dynamic data}) async {
    await _box.write(keyStore, data);
  }

  @override
  Future<Locale> getLocal() async {
    var data = await _box.read(keyStore);
    return Locale((data ?? 'ar'));
  }

  @override
  deleteLocal() async {
    await _box.write(keyStore, null);
  }
}
