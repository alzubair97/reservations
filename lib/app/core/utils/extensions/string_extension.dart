import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:intl/intl.dart';

extension StringExtension on String? {
  Color get color {
    try {
      if (this == null) throw '';
      String colorStr = this!;
      colorStr = "FF$colorStr";
      colorStr = colorStr.replaceAll("#", "");
      int val = 0;
      int len = colorStr.length;
      for (int i = 0; i < len; i++) {
        int hexDigit = colorStr.codeUnitAt(i);
        if (hexDigit >= 48 && hexDigit <= 57) {
          val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
        } else if (hexDigit >= 65 && hexDigit <= 70) {
          // A..F
          val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
        } else if (hexDigit >= 97 && hexDigit <= 102) {
          // a..f
          val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
        }
      }
      return Color(val);
    } catch (e) {
      return "#42ff5f".color;
    }
  }

  String? get getPathExtension {
    return this == null ? null : path.extension(this!);
  }

  String meragWithId(String id, {String slag = "#"}) {
    String data = this ?? '';
    return data.replaceAll(RegExp(slag), id).toString();
  }

  String get formateDate {
    try {
      return DateFormat('yyyy-MM-dd  hh:mm a').format(DateTime.parse(this!));
    } catch (e) {
      return this ?? '';
    }
  }

  String get formateDat2 {
    try {
      return DateFormat('MM/dd \n hh:mm a').format(DateTime.parse(this!));
    } catch (e) {
      return this ?? '';
    }
  }

  String get formateDat1 {
    try {
      return DateFormat('yyyy/MM/dd \n hh:mm a').format(DateTime.parse(this!));
    } catch (e) {
      return this ?? '';
    }
  }

  String get intFormateDate {
    try {
      String? d = this;
      return d != null
          ? "${d[0]}${d[1]}${d[2]}${d[3]} - ${d[4]}${d[5]} - ${d[6]}${d[7]}"
          : "";
    } catch (e) {
      return this ?? '';
    }
  }

  String get formateDateOnly {
    try {
      return DateFormat('yyyy-MM-dd').format(DateTime.parse(this!));
    } on Exception {
      return this ?? '';
    }
  }

  String get formateTimeOnly {
    return DateFormat.jm().format(DateTime.parse(this!));
  }

  String get smartFormateTimeOnly {
    String data = this!.split('.')[0];
    return DateFormat.jm().format(DateTime.parse('2020-02-02 $data'));
  }

  DateTime get converTimeToDateTime {
    String data = this!.split('.')[0];

    return DateTime.parse('2020-02-02 $data');
  }

  DateTime? get convertToDateTime {
    return this == null ? null : DateTime.parse(this!);
  }
}