import 'package:get/get.dart';
import 'package:reservations/langange/ar.dart';
import 'package:reservations/langange/en.dart';

class LocaleString extends Translations {
  @override
  // ignore: todo
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        //ENGLISH LANGUAGE
        'en_US': en,
        'ar': ar,
        //HINDI LANGUAGE
      };
}
