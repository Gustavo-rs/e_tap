import 'package:flutter/material.dart';

class AppTextFormField extends TextFormField {
  final String hintText;
  final IconData iconData;
  final TextEditingController controller;
  final Widget? suffixIcon;
  AppTextFormField(
      {Key? key,
      required this.hintText,
      required this.iconData,
      required this.controller,
      this.suffixIcon})
      : super(
          key: key,
          style: const TextStyle(color: Colors.black),
          controller: controller,
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
                    color: const Color.fromARGB(255, 35, 7, 192), width: 1.5)),
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            fillColor: Colors.transparent,
            filled: true,
          ),
        );
}
