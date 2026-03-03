import 'package:campers_closet/app/constants/app_colors.dart';
import 'package:campers_closet/app/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.color,
    this.textStyle,
    this.radius,
    this.margin = EdgeInsets.zero,
    required this.onTap,
    required this.text,
    this.loading = false,
    this.width,
    this.height,
    this.fontSize,
  });
  final Function()? onTap;
  final String text;
  final bool loading;
  final double? height;
  final double? width;
  final Color? color;
  final double? radius;
  final EdgeInsetsGeometry margin;
  final TextStyle? textStyle;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: ElevatedButton(
        onPressed: loading ? () {} : onTap,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 16.r),
          ),
          backgroundColor: color ?? AppColors.buttonPrimaryColor,
          minimumSize: Size(width ?? Get.width, height ?? 60.h),
        ),
        child: loading
            ? SizedBox(
                height: 20.h,
                width: 20.h,
                child: const CircularProgressIndicator(color: Colors.white),
              )
            : Text(
                text,
                style:
                    textStyle ??
                    AppTextStyles.title20_500(
                      color: Colors.white,
                    ),
              ),
      ),
    );
  }
}