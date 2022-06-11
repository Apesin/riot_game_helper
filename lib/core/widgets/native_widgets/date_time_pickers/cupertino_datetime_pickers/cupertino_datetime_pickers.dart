import '/core/constants/base_item_colors.dart';
import '/main.dart';
import 'package:flutter/cupertino.dart';

class CupertinoDateTimePickers extends BaseItemColors{
  static const String maximumDateTimeString = '2050-01-01 00:00:00.000';
  static const String minimumDateTimeString = '1950-01-01 00:00:00.000';
  Future<DateTime> cupertinoTimePicker() async {
    DateTime time = DateTime.now();
    await showCupertinoModalPopup<void>(
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return Container(
          color: baseWhiteColor,
          height: 250,
          child: CupertinoDatePicker(
            backgroundColor: baseWhiteColor,
            initialDateTime: time,
            mode: CupertinoDatePickerMode.time,
            use24hFormat: true,
            onDateTimeChanged: (DateTime newDate) {
              time = newDate;
            },
          ),
        );
      },
    );
    return time;
  }

  Future<DateTime> cupertinoDatePicker({int? maximumYear,int? minimumYear,DateTime? initialDateTime,DateTime? maximumDateTime,DateTime? minimumDateTime}) async {
    DateTime time = DateTime.now();
    await showCupertinoModalPopup<void>(
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return Container(
          color: baseWhiteColor,
          height: 250,
          child: CupertinoDatePicker(
            maximumYear: maximumYear??DateTime.now().year,
            minimumYear: minimumYear??DateTime.now().year,
            maximumDate: maximumDateTime ?? DateTime.parse(maximumDateTimeString),
            minimumDate: minimumDateTime ?? DateTime.parse(minimumDateTimeString),
            backgroundColor: baseWhiteColor,
            initialDateTime: initialDateTime ?? time,
            mode: CupertinoDatePickerMode.date,
            dateOrder: DatePickerDateOrder.dmy,
            onDateTimeChanged: (DateTime newDate) {
              time = newDate;
            },
          ),
        );
      },
    );
    return time;
  }

  Future<DateTime> cupertinoDateTimePicker() async {
    DateTime time = DateTime.now();
    await showCupertinoModalPopup<void>(
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return Container(
          color: baseWhiteColor,
          height: 250,
          child: CupertinoDatePicker(
            backgroundColor: baseWhiteColor,
            initialDateTime: time,
            mode: CupertinoDatePickerMode.dateAndTime,
            dateOrder: DatePickerDateOrder.dmy,
            use24hFormat: true,
            onDateTimeChanged: (DateTime newDate) {
              time = newDate;
            },
          ),
        );
      },
    );
    return time;
  }
}

