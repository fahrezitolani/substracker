import 'package:intl/intl.dart';

class CurrencyFormatter {
  CurrencyFormatter._();

  static String format(double amount, {String symbol = '\$'}) {
    final formatter = NumberFormat.currency(
      symbol: symbol,
      decimalDigits: 2,
    );
    return formatter.format(amount);
  }
}
