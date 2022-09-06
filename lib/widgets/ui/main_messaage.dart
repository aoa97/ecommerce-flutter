import 'package:flutter/material.dart';

class MainMessage {
  MainMessage._();

  static build(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          Icon(Icons.check_circle, color: Theme.of(context).primaryColor),
          const SizedBox(width: 16),
          Text(
            message,
            style: TextStyle(color: Theme.of(context).primaryColor),
          )
        ],
      ),
      backgroundColor: Colors.white,
    ));
  }
}
