import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authDecoration({
    required String hintext,
    required String label,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
      // label: label != null ? Text(label!) : null,
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.deepPurple,
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.deepPurple, width: 2),
      ),
      hintText: hintext,
      labelText: label,
      labelStyle: const TextStyle(
        color: Colors.grey,
      ),
      prefixIcon: prefixIcon != null
          ? Icon(prefixIcon, color: Colors.deepPurple)
          : null,
    );
  }
}
