import 'package:campers_closet/app/constants/app_colors.dart';
import 'package:campers_closet/app/constants/app_logos.dart';
import 'package:campers_closet/app/constants/app_text_style.dart';
import 'package:campers_closet/app/modules/forget_password/controllers/forget_password_controller.dart';
import 'package:campers_closet/app/widgets/custom_button.dart';
import 'package:campers_closet/app/widgets/labeled_text_field.dart';
import 'package:exui/exui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

class RequestPasswordView extends StatelessWidget {
  const RequestPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ForgetPasswordController>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 138.h),
                SvgPicture.asset(AppLogos.applogo, width: 100.w, height: 65.h),
                SizedBox(height: 30.h),
                Text(
                  'Request Password Reset',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.title30_400(
                    color: AppColors.primaryText,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  'Don\'t worry! It happens. Please enter the email associated with your account.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.title14_500(
                    color: AppColors.secondaryText,
                  ),
                ),
                SizedBox(height: 50.h),
                LabeledTextField(
                  label: "Email",
                  controller: controller.emailController,
                  prefixIcon: AppLogos.mail,
                  hintText: "Enter your email",
                  isEmail: true,
                  errorMessage: controller.emailError,
                  bottomPadding: 30,
                  textInputAction: TextInputAction.done,
                ),
                Obx(
                  () => CustomButton(
                    onTap: controller.isLoading.value
                        ? null
                        : controller.validateAndRequestReset,
                    text: controller.isLoading.value
                        ? 'Sending...'
                        : 'Send Code',
                    fontSize: 18.sp,
                    height: 44.h,
                    radius: 16.r,
                  ),
                ).paddingBottom(50.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
