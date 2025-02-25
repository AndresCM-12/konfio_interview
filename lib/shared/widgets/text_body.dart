import 'package:flutter/material.dart';

class TextBody extends StatelessWidget {
  final String text;
  final int? maxLines;
  const TextBody({
    super.key,
    required this.text,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        height: 1.2,
        color: Color(0xFF666666),
        fontStyle: FontStyle.normal,
      ),
    );
  }
}
