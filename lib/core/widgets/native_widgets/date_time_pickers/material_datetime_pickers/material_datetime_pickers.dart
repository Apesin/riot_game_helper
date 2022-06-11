import 'package:flutter/material.dart';

import '/main.dart';

class MaterialDateTimePickers {
  static const String maximumDateTimeString = '2050-01-01 00:00:00.000';
  static const String minimumDateTimeString = '1950-01-01 00:00:00.000';

  Future<DateTime> materialTimePicker() async {
    DateTime time = DateTime.now();
    await showTimePicker(
      context: navigatorKey.currentContext!,
      initialTime: const TimeOfDay(hour: 0, minute: 0),
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(
          alwaysUse24HourFormat: true,
        ),
        child: child!,
      ),
    ).then((value) {
      if (value != null) {
        time =
            DateTime(time.year, time.month, time.day, value.hour, value.minute);
      }
    });
    return time;
  }

  Future<DateTime> materialDatePicker({int? maximumYear,int? minimumYear,DateTime? initialDateTime,DateTime? maximumDateTime,DateTime? minimumDateTime}) async {
    DateTime time = DateTime.now();
    await showDatePicker(
      context: navigatorKey.currentContext!,
      initialDate: initialDateTime ?? time,
      firstDate: minimumDateTime ?? DateTime.parse(minimumDateTimeString),
      lastDate: maximumDateTime ?? DateTime.parse(maximumDateTimeString),
      initialDatePickerMode: DatePickerMode.day,
    ).then((value) {
      if (value != null) {
        time = value;
      }
    });
    return time;
  }

  Future<DateTime> materialDateTimePicker() async {
    DateTime time = DateTime.now();
    await showDatePicker(
      context: navigatorKey.currentContext!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020, 1, 1),
      lastDate: DateTime.now().add(const Duration(days: 356)),
      initialDatePickerMode: DatePickerMode.day,
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(
          alwaysUse24HourFormat: true,
        ),
        child: child!,
      ),
    ).then((v) async {
      if (v != null) {
        time = v;
        await showTimePicker(
          context: navigatorKey.currentContext!,
          initialTime: const TimeOfDay(hour: 0, minute: 0),
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(
              alwaysUse24HourFormat: true,
            ),
            child: child!,
          ),
        ).then((value) {
          if (value != null) {
            time = DateTime(
                time.year, time.month, time.day, value.hour, value.minute);
          }
        });
      }
    });
    return time;
  }
}
