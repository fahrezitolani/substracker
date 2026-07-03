import 'package:intl/intl.dart';

class DateHelpers {
  DateHelpers._();

  static String formatDate(DateTime date) {
    return DateFormat('MMM dd, yyyy').format(date);
  }

  static String formatShortDate(DateTime date) {
    return DateFormat('MM/dd/yyyy').format(date);
  }

  static int daysUntil(DateTime targetDate) {
    final now = DateTime.now();
    final target = DateTime(targetDate.year, targetDate.month, targetDate.day);
    final today = DateTime(now.year, now.month, now.day);
    return target.difference(today).inDays;
  }
}
