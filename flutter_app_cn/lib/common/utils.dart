import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Convert a number to Human readable format (e.g. 1.5k, 5m, 1b)
String formattedNumber(int numberToFormat) {
  var _formattedNumber = NumberFormat.compactCurrency(
    decimalDigits: 2,
    symbol:
        '', // if you want to add currency symbol then pass that in this else leave it empty.
  ).format(numberToFormat);
  return _formattedNumber;
}

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
