import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';
import 'package:reservations/langange/string.dart';

class TextValidate {
  String? validateMobileNumber(String val,{Function()? checkApi}) {
    if (val.isNumericOnly) {
      if(val.startsWith('77')||val.startsWith('78')||val.startsWith('71')||val.startsWith('73')||val.startsWith('70')){
        if (val.trim().length > 9) {
          return "رقم الموبايل غير صحيح ";
        } else {
          if (checkApi != null) checkApi();
          return null;
        }
      }else{
        return 'يجب ان يبد الرقم  [77,78,73,71,70]';
      }

    } else {
      return TranslateText.notAcceptTextValue.tr;
    }
  }

}
