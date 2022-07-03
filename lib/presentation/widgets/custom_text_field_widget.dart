import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Color? backGroundColor;
  final TextStyle? style;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.keyboardType,
      required this.hintText,
      this.backGroundColor,
      this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: backGroundColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              //contentPadding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.0.h),
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: style),
          style: style,
        ),
      ),
    );
  }
}

class CustomPasswordTextField extends StatelessWidget {
  final String hintText;
  final Color? backGroundColor;
  final TextStyle? style;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final Widget suffixIcon;
  final bool obscureText;
  const CustomPasswordTextField(
      {Key? key,
      required this.controller,
      required this.keyboardType,
      required this.hintText,
      this.backGroundColor,
      this.style,
      required this.obscureText,
      required this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: backGroundColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          textAlignVertical: TextAlignVertical.center,
          obscureText: obscureText,
          decoration: InputDecoration(
              //contentPadding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.0.h),
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: style,
              suffixIcon: suffixIcon),
          style: style,
        ),
      ),
    );
  }
}
