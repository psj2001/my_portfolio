import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';

class CustomTexfeild extends StatelessWidget {
  const CustomTexfeild({
    super.key,
    required this.getInputBorder,
    this.controller,
    this.maxline = 1,
    this.hinttext,
  });

  final OutlineInputBorder getInputBorder;
  final TextEditingController? controller;
  final int maxline;
  final String? hinttext;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxline,
      style: TextStyle(color: CustomColor.scaffoldBg),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16),
          filled: true,
          fillColor: CustomColor.whitePrimary,
          focusedBorder: getInputBorder,
          enabledBorder: getInputBorder,
          border: getInputBorder,
          hintText: hinttext,
          hintStyle: TextStyle(
            color: CustomColor.hintDark,
          )),
    );
  }
}
