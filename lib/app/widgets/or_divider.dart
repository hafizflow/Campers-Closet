import 'package:campers_closet/app/constants/app_colors.dart';
import 'package:campers_closet/app/constants/app_text_style.dart';
import 'package:exui/exui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: AppColors.greyDivider)),
        Text(
          'OR',
          style: AppTextStyles.title12_500(color: AppColors.primaryText),
        ).paddingHorizontal(16.w),
        Expanded(child: Divider(color: AppColors.greyDivider)),
      ],
    );
  }
}
