import 'package:flutter/material.dart';

extension ShowSnackBar on BuildContext {
  void showSnackBar({
    required String message,
    Color? textColor,
    Color? backgroundColor,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(
        message,
        style: backgroundColor == null
            ? null
            : TextStyle(color: textColor),
      ),
      backgroundColor:
          backgroundColor ?? Theme.of(this).snackBarTheme.backgroundColor,
    ));
  }

  void showErrorSnackBar({required String message}) {
    showSnackBar(
        message: message, backgroundColor: Theme.of(this).colorScheme.error);
  }
}
