import 'package:doctor_flutter_v1/core/utils/app_color.dart';
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
      decoration: BoxDecoration(
        color: AppColor.whiteClr,
        borderRadius: BorderRadius.circular(40.r),
      ),
      padding: EdgeInsets.all(24.r),
      child: FrequentlyAskedListView(),
    );
  }
}
