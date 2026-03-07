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

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

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
                SizedBox(height: 108.h),
                SvgPicture.asset(AppLogos.applogo, width: 100.w, height: 65.h),
                SizedBox(height: 30.h),
                Text(
                  'Reset Password',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.title30_400(
                    color: AppColors.primaryText,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  'Please type something you’ll remember',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.title14_500(
                    color: AppColors.secondaryText,
                  ),
                ),
                SizedBox(height: 50.h),
                LabeledTextField(
                  label: "Password",
                  controller: controller.passwordController,
                  prefixIcon: AppLogos.lock,
                  hintText: "Enter your password",
                  isPassword: true,
                  errorMessage: controller.passwordError,
                ),

                SizedBox(height: 10.h),
                LabeledTextField(
                  label: "Confirm Password",
                  controller: controller.confirmPasswordController,
                  prefixIcon: AppLogos.lock,
                  hintText: "Confirm your password",
                  isPassword: true,
                  textInputAction: TextInputAction.done,
                  errorMessage: controller.confirmPasswordError,
                ),
                SizedBox(height: 20.h),
                Obx(
                  () => CustomButton(
                    onTap: controller.isLoading.value
                        ? null
                        : controller.resetPassword,
                    text: controller.isLoading.value
                        ? 'Submitting...'
                        : 'Submit',
                    fontSize: 18.sp,
                    height: 44.h,
                    radius: 16.r,
                  ),
                ),
              ],
            ),
          ).paddingBottom(50.h),
        ),
      ),
    );
  }
}
