import 'package:intl/intl.dart';

class ConvertDateTime {
  static String convertDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    final String formatted = formatter.format(dateTime);
    return formatted;
  }

  static String convertDate(DateTime dateTime) {
    final DateFormat formatter = DateFormat('yyyy/MM/dd');
    final String formatted = formatter.format(dateTime);
    return formatted;
  }
}
