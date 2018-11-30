import 'package:flutter/material.dart';

class Forms {
  Widget buildTextField(
    BuildContext context,
    String label,
    IconData icon,
    TextInputType type,
    bool obscure,
  ) {
    return Column(
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: icon != null ? Icon(icon) : null,
            labelText: label,
          ),
          keyboardType: type,
          obscureText: obscure,
          textCapitalization: TextCapitalization.words,
        ),
        SizedBox(
          height: 10.0,
        )
      ],
    );
  }
}
