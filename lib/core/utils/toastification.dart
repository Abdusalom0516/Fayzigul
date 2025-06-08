import 'package:flutter/cupertino.dart';
import 'package:toastification/toastification.dart';

class Toastification {
  static const int _closeDuration = 3;

  static void error(BuildContext context, String message) {
    toastification.show(
      type: ToastificationType.error,
      context: context,
      showProgressBar: false,
      title: Text(message),
      dragToClose: true,
      autoCloseDuration: const Duration(seconds: _closeDuration),
    );
  }

  static void warning(BuildContext context, String message) {
    toastification.show(
      type: ToastificationType.warning,
      context: context,
      dragToClose: true,
      title: Text(message),
      autoCloseDuration: const Duration(seconds: _closeDuration),
    );
  }

  static void success(BuildContext context, String message) {
    toastification.show(
      type: ToastificationType.success,
      dragToClose: true,
      context: context,
      title: Text(message),
      autoCloseDuration: const Duration(seconds: _closeDuration),
    );
  }

  static void info(BuildContext context, String message) {
    toastification.show(
      type: ToastificationType.info,
      dragToClose: true,
      context: context,
      title: Text(message),
      autoCloseDuration: const Duration(seconds: _closeDuration),
    );
  }
}
