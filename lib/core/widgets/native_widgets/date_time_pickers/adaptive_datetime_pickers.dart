import 'dart:io';
import 'cupertino_datetime_pickers/cupertino_datetime_pickers.dart';
import 'material_datetime_pickers/material_datetime_pickers.dart';

class AdaptiveDateTimePickers {
  final MaterialDateTimePickers _androidDateTimePickers =
      MaterialDateTimePickers();
  final CupertinoDateTimePickers _iosDateTimePickers =
      CupertinoDateTimePickers();

  Future<DateTime> adaptiveTimePicker() {
    return Platform.isAndroid
        ? _androidDateTimePickers.materialTimePicker()
        : _iosDateTimePickers.cupertinoTimePicker();
  }

  Future<DateTime> adaptiveDatePicker(
      {int? maximumYear,
      int? minimumYear,
      DateTime? initialDateTime,
      DateTime? maximumDateTime,
      DateTime? minimumDateTime}) {
    return Platform.isAndroid
        ? _androidDateTimePickers.materialDatePicker(
            initialDateTime: initialDateTime,
            maximumDateTime: maximumDateTime,
            maximumYear: maximumYear,
            minimumYear: minimumYear,
            minimumDateTime: minimumDateTime)
        : _iosDateTimePickers.cupertinoDatePicker(
            initialDateTime: initialDateTime,
            maximumYear: maximumYear,
            minimumYear: minimumYear,
            );
  }

  Future<DateTime> adaptiveDateTimePicker() {
    return Platform.isAndroid
        ? _androidDateTimePickers.materialDateTimePicker()
        : _iosDateTimePickers.cupertinoDateTimePicker();
  }
}
