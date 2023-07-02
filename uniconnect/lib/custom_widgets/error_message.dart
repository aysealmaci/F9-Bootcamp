import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';

class ErrorMessage {
  void cherry_toast(BuildContext context, String title, String content,
      IconData icon, Color color) {
    return CherryToast(
            icon: icon,
            themeColor: color,
            title: Text(title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            displayTitle: true,
            description: Text(content,
                style: TextStyle(
                  fontSize: 14,
                )),
            toastPosition: Position.bottom,
            animationType: AnimationType.fromBottom,
            animationDuration: Duration(milliseconds: 1000),
            autoDismiss: true)
        .show(context);
  }
}
