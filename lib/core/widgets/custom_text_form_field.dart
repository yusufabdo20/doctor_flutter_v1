import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/utils/app_style.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gen_extension/gen_extension.dart';

class CustomTextFormFeild extends StatefulWidget {
  final String text;
  final IconData? prefixIcon;
  final bool isPassword;
  final bool showTitle;
  final int? maxLines;
  final double borderRadius;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  final TextEditingController? controller;
  const CustomTextFormFeild({
    super.key,
    required this.text,
    this.prefixIcon,
    this.keyboardType,
    this.showTitle = true,
    this.isPassword = false,
    this.validator,
    this.controller,
    this.onChanged,
    this.maxLines = 1,
    this.borderRadius = 16,
  });

  @override
  State<CustomTextFormFeild> createState() => _CustomTextFormFeildState();
}

class _CustomTextFormFeildState extends State<CustomTextFormFeild> {
  bool obscureText = true;

  OutlineInputBorder border(BuildContext context) => OutlineInputBorder(
      borderSide: BorderSide(
        color: context.theme.primaryColor,
        width: 1,
      ),
      gapPadding: 24,
      borderRadius: BorderRadius.circular(widget.borderRadius));

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: widget.showTitle,
            replacement: const SizedBox.shrink(),
            child: Column(
              children: [
                CustomText(
                  text: context.tr(widget.text),
                  style: AppStyle.textStyle14RegularKufram,
                  color: AppColor.blue,
                ),
                SizedBox(
                  height: 8.r,
                ),
              ],
            ),
          ),
          TextFormField(
            keyboardType: widget.isPassword
                ? TextInputType.visiblePassword
                : widget.keyboardType,
            obscureText: widget.isPassword ? obscureText : false,
            validator: widget.validator,
            onChanged: widget.onChanged,
            controller: widget.controller,
            maxLines: widget.maxLines,
            style: AppStyle.textStyle14RegularKufram
                .copyWith(color: AppColor.blue),
            decoration: InputDecoration(
              hintText: context.tr(widget.text),
              filled: true,
              fillColor: AppColor.white.withOpacity(0.45),
              contentPadding: EdgeInsets.all(8.r),
              labelStyle: AppStyle.textStyle14RegularKufram,
              hintStyle: AppStyle.textStyle14RegularKufram.copyWith(
                color: AppColor.grayClr,
              ),
              prefixIcon: widget.prefixIcon != null
                  ? Icon(
                      widget.prefixIcon,
                      color: AppColor.blue,
                    )
                  : null,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        obscureText ? Icons.visibility : Icons.visibility_off,
                        color: AppColor.blue,
                      ),
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    )
                  : null,
              border: border(context),
              enabledBorder: border(context),
              focusedBorder: border(context),
              errorBorder: border(context),
              focusedErrorBorder: border(context),
            ),
          ),
        ],
      ),
    );
  }
}
