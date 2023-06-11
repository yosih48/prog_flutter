import 'package:flutter/material.dart';
import 'package:rest_api/Constants/AppStrings.dart';

void showAlertDialog(BuildContext context, String title, {String? subtitle}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: subtitle != null ? Text(subtitle) : null,
        actions: [
          TextButton(
            child: const Text(AppStrings.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
