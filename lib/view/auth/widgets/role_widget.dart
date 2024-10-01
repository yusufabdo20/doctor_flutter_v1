import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/utils/app_style.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoleWidget extends StatefulWidget {
  RoleWidget({
    super.key,
  });

  @override
  State<RoleWidget> createState() => _RoleWidgetState();
}

class _RoleWidgetState extends State<RoleWidget> {
  int _selectedIndex = 0;
  final List<String> _options = [
    'Doctor',
    'Patient',
    'Receptionist',
  ];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      borderRadius: BorderRadius.circular(10.r),
      borderColor: AppColor.blue,
      selectedBorderColor: AppColor.blue,
      isSelected:
          List.generate(_options.length, (index) => index == _selectedIndex),
      onPressed: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      children: _options
          .map((String label) => Padding(
                padding: EdgeInsets.all(10.r),
                child: CustomText(
                  text: label,
                  style: AppStyle.textStyle16RegularKufram,
                  color: _selectedIndex == _options.indexOf(label)
                      ? AppColor.blue
                      : AppColor.grayClr,
                ),
              ))
          .toList(),
    );
  }
}
