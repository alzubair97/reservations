import 'package:flutter/cupertino.dart';

// must be 2 names at least and each one contains 2..12 character
const Pattern namePattern = r'(^.{2,12}(?: .{2,12})?(?: .{2,12})$)';

const Pattern emailPattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

const Pattern phonePattern = r'^(9677|7)(0|1|3|7)[0-9]{7}$';

const Pattern passwordPattern = r'^.{6,}$';

const Pattern idCardPattern = r'([0-9]{11,11})';

class ValidateHelper {
  final BuildContext context;

  const ValidateHelper.of(this.context);

  String? name(String value) => !RegExp(namePattern.toString()).hasMatch(value)
      ? 'يرجى ادخال الاسم بالشكل الصحيح'
      : null;

  String? select(dynamic value) => value == null ? 'يرجى تحديد عنصر' : null;

  String? required(dynamic value) =>
      (value is String ? value.isEmpty : value == null)
          ? 'هذا الحقل مطلوب '
          : null;

  String? phone(String? value) =>
      !RegExp(phonePattern.toString()).hasMatch(value!)
          ? 'يرجى ادخال رقم الهاتف بالشكل الصحيح'
          : null;

  String? card(String value) =>
      !RegExp(idCardPattern.toString()).hasMatch(value)
          ? 'يرجى ادخال رقم البطاقة بالشكل الصحيح'
          : null;
  String? email(String value) =>
      !RegExp(emailPattern.toString()).hasMatch(value)
          ? 'Please enter the email correctly'
          : null;

  // String ? email(String value) => !RegExp(emailPattern).hasMatch(value)
  //     ? FlutterI18n.translate(context, _key, {'attribute': 'email'})
  //     : null;

  String? password(String value) =>
      !RegExp(passwordPattern.toString()).hasMatch(value)
          ? 'The password must be more than 6 digits'
          : null;
  cPassword(String pass1, String pass2) =>
      (pass1 != pass2) ? 'password does not match' : null;

  String? price(String value) {
    if (value == "") return 'يجب ادخال قيمة';

    try {
      if (double.parse(value) < 0) {
        return 'يجب ان يكون المبلغ اكبر من صفر';
      } else {
        return null;
      }
    } catch (e) {
      return 'يجب ادخل المبلغ بشكل صحيح';
    }
  }

  String? priceAfter(String priceAfter, String value) {
    price(value);
    price(priceAfter);

    if (double.parse(priceAfter) < double.parse(value)) {
      return null;
    } else {
      return 'يجب ان يكون المبلغ اقل من السعر';
    }
  }

  String? customeValidtor(String value, Pattern pattern) =>
      !RegExp(pattern.toString()).hasMatch(value)
          ? 'يرجاء ادخال قيمة صحيحة'
          : null;
  String? amtValditor(String value, double min, double max) {
    if (double.parse(value) > max) return 'المبلغ المدخل اكبر من $max';
    if (double.parse(value) < min) return 'المبلغ المدخل اصغر من $max';

    return null;
  }

  String? discountValditor(String value, double min, double max) {
    try {
      if (double.parse(value) > max) {
        return 'لايمكن ان يكون الخصم اكبر من  $max';
      }
      if (double.parse(value) < min) {
        return 'الخصم لايجب ان يكون اقل من  $min';
      }
    } catch (e) {
      return 'ادخل قيمة صحيحة';
    }
    return null;
  }
}
