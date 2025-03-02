
import 'package:flutter/material.dart';

import '../style/style.dart';

Widget buildTextFormField(TextEditingController controller, String label) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: TextFormField(
      controller: controller,
      decoration: inputDecoration(hintText: label, labelText: label),
      validator: (value) => (value == null || value.isEmpty) ? "Enter $label" : null,
    ),
  );
}