import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final double size;

  const CustomCheckbox({
    super.key,
    required this.value,
    this.size = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 1.5),
        borderRadius: BorderRadius.circular(4.r),
        color: Colors.transparent,
      ),
      child: value
          ? Center(
              child: Icon(Icons.check, size: 12.sp, color: Colors.black),
            )
          : null,
    );
  }
}