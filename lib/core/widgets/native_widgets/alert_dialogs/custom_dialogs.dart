import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../main.dart';
import '/core/widgets/native_widgets/alert_dialogs/cupertino_dialogs/cupertino_dialogs.dart';
import '/core/widgets/native_widgets/alert_dialogs/material_dialogs/material_dialogs.dart';

class AdaptiveDialogs {
  final MaterialDialogs _materialDialogs = MaterialDialogs();
  final CupertinoDialogs _cupertinoDialogs = CupertinoDialogs();

  adaptiveOkDialog({
    required String title,
    required String content,
    required Function buttonFunction,
    String okButtonText = "Tamam",
  }) {
    return Platform.isAndroid
        ? showDialog(
            context: navigatorKey.currentContext!,
            builder: (_) {
              return _materialDialogs.materialOkDialog(
                okButtonText: okButtonText,
                title: title,
                content: content,
                buttonFunction: () => buttonFunction(),
              );
            })
        : showCupertinoDialog(
            context: navigatorKey.currentContext!,
            builder: (_) {
              return _cupertinoDialogs.cupertinoOkDialog(
                okButtonText: okButtonText,
                title: title,
                content: content,
                okFunction: () => buttonFunction(),
              );
            });
  }

  adaptiveOkCancelDialog({
    required String title,
    required String content,
    required Function okFunction,
    required Function cancelFunction,
    String okButtonText = "Tamam",
    String cancelButtonText = "İptal",
  }) {
    return Platform.isAndroid
        ? showDialog(
            context: navigatorKey.currentContext!,
            builder: (_) {
              return _materialDialogs.materialOkCancelDialog(
                title: title,
                content: content,
                okFunction: () => okFunction(),
                okButtonText: okButtonText,
                cancelFunction: () => cancelFunction(),
                cancelButtonText: cancelButtonText,
              );
            })
        : showCupertinoDialog(
            context: navigatorKey.currentContext!,
            builder: (_) {
              return _cupertinoDialogs.cupertinoOkCancelDialog(
                title: title,
                content: content,
                okFunction: () => okFunction(),
                okButtonText: okButtonText,
                cancelFunction: () => cancelFunction(),
                cancelButtonText: cancelButtonText,
              );
            });
  }
}
