import 'package:flutter/material.dart';

class Alert {
  static void show(BuildContext context, String message, String type) {
    Color color = Colors.black; // Default color

    // Check the type and set the color accordingly
    if (type == 'error') {
      color = Colors.red;
    } else if (type == 'info') {
      color = Colors.blue;
    } else if (type == 'success') {
      color = Colors.green;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: color),
        ),
      ),
    );
  }
}
