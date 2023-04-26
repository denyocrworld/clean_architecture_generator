import 'package:intl/intl.dart';

class StringUtil {
  static String toMoneyFormat(num value) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$ ').format(value);
  }
}

extension NumExtension on num {
  String get money {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$ ').format(this);
  }

  String get idr {
    return NumberFormat.currency(locale: 'en_US', symbol: 'IDR ').format(this);
  }
}
