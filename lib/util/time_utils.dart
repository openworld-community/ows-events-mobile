import 'package:intl/intl.dart';

class TimeUtils {
  static String formatDateTime(
      DateTime? dateTime,
      {String format = 'dd MMMM, HH:mm'}
      ) {

    return dateTime != null ? DateFormat(format).format(dateTime) : '';
  }
}