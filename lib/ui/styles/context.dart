import 'package:flutter/material.dart';

extension ShowSnackBar on BuildContext {
  void showSnackBar({
    required String message,
    Color? backgroundColor,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(
        message,
        style: backgroundColor == null
            ? null
            : TextStyle(color: Theme.of(this).colorScheme.onError),
      ), // assuming that only error color will be provided as background color :skull:
      backgroundColor:
          backgroundColor ?? Theme.of(this).snackBarTheme.backgroundColor,
    ));
  }

  void showErrorSnackBar({required String message}) {
    showSnackBar(
        message: message, backgroundColor: Theme.of(this).colorScheme.error);
  }
}
