import 'package:doctor_flutter_v1/config/localization.dart';
import 'package:doctor_flutter_v1/controller/countact_us/countact_us_cubit.dart';
import 'package:doctor_flutter_v1/core/utils/app_color.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text_form_field.dart';
import 'package:doctor_flutter_v1/presentation/contact_us/widget/countact_us_send_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        color: AppColor.whiteClr,
      ),
      child: Form(
        key: CountactUsCubit.get(context).formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFormFeild(
                controller: CountactUsCubit.get(context).nameController,
                text: AppText.userName,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.tr(AppText.pleaseEnterUserName);
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15.r,
              ),
              CustomTextFormFeild(
                controller: CountactUsCubit.get(context).emailController,
                text: AppText.email,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.tr(AppText.pleaseEnterEmail);
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15.r,
              ),
              CustomTextFormFeild(
                controller: CountactUsCubit.get(context).titleController,
                text: AppText.title,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.tr(AppText.pleaseEnterTitle);
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15.r,
              ),
              CustomTextFormFeild(
                controller: CountactUsCubit.get(context).messageController,
                text: AppText.description,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.tr(AppText.pleaseEnterDescription);
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 24.r,
              ),
              const CountactUsSendButton(),
              SizedBox(
                height: 15.r,
              ),
            ],
          ),
        ),
      ),
    );
  }
}