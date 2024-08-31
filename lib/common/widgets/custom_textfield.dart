import 'package:flutter/material.dart';
import 'package:satyam/constants/global_variable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;

  const CustomTextfield(
      {super.key,
      required this.controller,
      required this.hintText,
      this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GlobalVariables.subBodyStyle,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $hintText';
        }
        if(isPassword && val.length<6){
          return '$hintText must be min 6 character';
        }

        return null;
      },
    );
  }
}
