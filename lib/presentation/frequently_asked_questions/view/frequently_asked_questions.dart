import 'package:doctor_flutter_v1/config/localization.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text.dart';
import 'package:doctor_flutter_v1/presentation/frequently_asked_questions/widgets/frequently_asked_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FrequentlyAskedQuestions extends StatelessWidget {
  const FrequentlyAskedQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsetsDirectional.only(top: 24.r, end: 24.r),
      decoration: const BoxDecoration(
        color: AppColor.whiteClr,
      ),
      padding: EdgeInsets.all(24.r),
      child: const FrequentlyAskedListView(),
    );
  }
}
