import 'package:flutter/material.dart';
import 'package:sh_mobile/config/utils/constant/constants.dart';

class SpanBody extends StatelessWidget {
  final String text;
  const SpanBody({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        height: 1.2,
        color: Color(Constants.primaryFontColor),
        fontStyle: FontStyle.normal,
      ),
    );
  }
}
