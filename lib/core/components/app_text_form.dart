import 'package:flutter/material.dart';

class AppTextFormField extends TextFormField {
  final String hintText;
  final IconData iconData;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool obscureText;
  AppTextFormField(
      {Key? key,
      required this.hintText,
      required this.iconData,
      required this.controller,
      this.obscureText = false,
      this.suffixIcon})
      : super(
          key: key,
          style: const TextStyle(color: Colors.black),
          cursorColor: Color(0xFF107AFF),
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey[600],
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey[500]!, width: 1.5)),
            prefixIcon: Icon(
              iconData,
              color: Colors.grey[700],
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: Color(0xFF107AFF), width: 1.5)),
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            fillColor: Colors.transparent,
            filled: true,
          ),
        );
}
