import 'package:flutter/material.dart';

class UIExceptionManager {
  final GlobalKey<ScaffoldMessengerState> _messengerKey;

  UIExceptionManager(this._messengerKey);

  void showSnackbar(String message) {
    _messengerKey.currentState
      ?..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
  }
}
