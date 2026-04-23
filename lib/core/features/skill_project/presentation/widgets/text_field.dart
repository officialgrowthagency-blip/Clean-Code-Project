import 'package:flutter/material.dart';


class TextFormFieldCustom extends StatelessWidget {

    final TextEditingController controller;
    final String helperText;
    final TextInputType? keyboardType;
  const TextFormFieldCustom({super.key,
  required this.controller,
  required this.helperText,
  this.keyboardType });

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
              keyboardType: keyboardType,
             controller: controller,
             decoration: InputDecoration(
             helperText: helperText,
             border: OutlineInputBorder(),
              ),
              validator: (String? value) {
                if(value == null || value.trim().isEmpty){
                  return "Wrong input";
                } else {
                  return null;
                }
              },
            );
  }
}

