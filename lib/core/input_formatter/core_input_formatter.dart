import 'package:flutter/services.dart';

class CoreInputFormatter{
  ///Not allow space
  static FilteringTextInputFormatter notAllowSpace = FilteringTextInputFormatter.deny(RegExp(r"\s"));
  ///Only number
  static FilteringTextInputFormatter onlyNumber = FilteringTextInputFormatter.allow(RegExp(r"[0-9]"));
  ///Only text
  static FilteringTextInputFormatter onlyLetters = FilteringTextInputFormatter.allow(RegExp(r"[a-zA-ZÇçğĞıİöÖüÜŞş]"));
  ///Only text and number
  static FilteringTextInputFormatter onlyLettersAndNumber = FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z0-9ÇçğĞıİöÖüÜŞş]"));
  ///Only text and number
  static FilteringTextInputFormatter onlyLettersAndNumberAndSpace = FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z0-9ÇçğĞıİöÖüÜŞş]+|\s"));
  ///Only text and space
  static FilteringTextInputFormatter onlyLettersAndSpace = FilteringTextInputFormatter.allow(RegExp(r"[a-zA-ZÇçğĞıİöÖüÜŞş]+|\s"));
  ///Only number and space
  static FilteringTextInputFormatter onlyNumberAndSpace = FilteringTextInputFormatter.allow(RegExp(r"[0-9]+|\s"));
  ///Only decimal number
  static FilteringTextInputFormatter onlyDecimalNumber = FilteringTextInputFormatter.allow(RegExp(r"^\d?\.?\d{0,5}"));
  ///Email
  static FilteringTextInputFormatter email = FilteringTextInputFormatter.allow(RegExp(r"[0-9a-z@_.-]"));
  
}