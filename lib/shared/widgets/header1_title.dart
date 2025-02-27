import 'package:flutter/material.dart';
import 'package:sh_mobile/config/utils/constant/constants.dart';

class Header1 extends StatelessWidget {
  final String title;
  const Header1({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w500,
          color: Color(Constants.primaryFontColor)),
    );
  }
}
