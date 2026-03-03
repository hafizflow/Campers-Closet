import 'package:campers_closet/app/constants/app_sizes.dart';
import 'package:campers_closet/app/constants/app_strings.dart';
import 'package:campers_closet/app/modules/onboarding/widgets/intro_component.dart';
import 'package:campers_closet/app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<OnboardingController>(
        builder: (logic) {
          return Stack(
            children: [
              PageView.builder(
                controller: logic.pageController,
                itemCount: logic.pages.length,
                onPageChanged: logic.onPageChanged,
                itemBuilder: (context, index) {
                  final page = logic.pages[index];
                  return IntroComponent(
                    title: page.title,
                    description: page.description,
                    imagePath: page.imagePath,
                  );
                },
              ),

              Positioned(
                bottom: 164.h,
                left: 0.w,
                right: 0.w,
                child: Center(
                  child: SmoothPageIndicator(
                    controller: logic.pageController,
                    count: logic.pages.length,
                    effect: const ExpandingDotsEffect(
                      expansionFactor: 6,
                      spacing: 8,
                      radius: 7,
                      dotWidth: 6,
                      dotHeight: 6,
                      dotColor: Colors.white,
                      activeDotColor: Colors.white,
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: 64.h,
                left: AppSizes.defaultPadding.w,
                right: AppSizes.defaultPadding.w,
                child: CustomButton(
                  onTap: logic.nextPage,
                  text: logic.isLastPage
                      ? AppStrings.getStarted
                      : AppStrings.next,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}