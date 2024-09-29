import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gen_extension/gen_extension.dart';

class CustomText extends StatelessWidget {
  final TextStyle style;
  final Color? color;
  final String text;
  final TextAlign textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines;
  const CustomText(
      {super.key,
      required this.text,
      this.color,
      required this.style,
      this.textOverflow = TextOverflow.ellipsis,
      this.maxLines = 1,
      this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      textAlign: textAlign,
      maxLines: maxLines,
      
      style: TextStyle(
        color: context.isDarkMode ? Colors.white : Colors.black,
        overflow: textOverflow,
  
      ),
      child: Text(
        context.tr(text),
        style: style.copyWith(
          color: color,
        ),
      ),
    );
  }
}