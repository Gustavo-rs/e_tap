import 'package:flutter/material.dart';

class AppTextFormField extends TextFormField {
  final String? hintText;
  final IconData? iconData;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool? obscureText;
  final String? Function(String?)? validator;
  AppTextFormField(
      {Key? key,
      this.hintText,
      this.iconData,
      required this.controller,
      this.obscureText = false,
      this.validator,
      this.suffixIcon})
      : super(
          key: key,
          style: TextStyle(
            color: Colors.grey[700],
          ),
          cursorColor: Color(0xFF477BFF),
          validator: validator,
          controller: controller,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey[700],
            ),
            prefixIcon: Icon(
              iconData,
              color: Colors.grey[700],
            ),
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none),
            fillColor: Colors.white,
            filled: true,
          ),
        );
}
