import 'package:intl/intl.dart';

extension DoubleExtension on double? {
  String get formatMonye {
    final oCcy = NumberFormat("#,##0.00", "en_US");
    return oCcy.format(this ?? 0);
  }

  String get formatMonyeWithCurrency {
    final oCcy = NumberFormat("#,##0.00", "en_US");
    return oCcy.format(this ?? 0) + ' SAR';
  }
}