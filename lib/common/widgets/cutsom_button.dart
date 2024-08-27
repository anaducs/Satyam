import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onTap;

  const CustomButton(
      {super.key, required this.buttonName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(buttonName),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50.h)
      ),
    );
  }
}
