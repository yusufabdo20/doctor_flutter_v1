import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/utils/app_style.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text.dart';
import 'package:doctor_flutter_v1/model/faqs/faqs_model_data.dart';
import 'package:flutter/material.dart';

class InActiveAskedListViewItem extends StatelessWidget {
  final FaqsModelData faqsModelData;
  const InActiveAskedListViewItem({
    super.key,
    required this.faqsModelData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.centerStart,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColor.blue),
        borderRadius: BorderRadius.circular(18),
      ),
      child: CustomText(
        text: faqsModelData.question,
        style: AppStyle.textStyle16MediumKufram,
        maxLines: 100,
      ),
    );
  }
}

class ActiveAskedListViewItem extends StatelessWidget {
  final FaqsModelData faqsModelData;

  const ActiveAskedListViewItem({
    super.key,
    required this.faqsModelData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: double.infinity,
      alignment: AlignmentDirectional.centerStart,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColor.blue),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            alignment: AlignmentDirectional.centerStart,
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadiusDirectional.circular(20),
            ),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: CustomText(
              text: faqsModelData.question,
              style: AppStyle.textStyle16BoldKufram,
              maxLines: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: CustomText(
              text: faqsModelData.answer,
              style: AppStyle.textStyle12RegularKufram,
              maxLines: 100,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
