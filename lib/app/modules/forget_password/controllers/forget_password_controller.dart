import 'package:campers_closet/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  /// Text Controller
  final TextEditingController emailController = TextEditingController();

  /// Loading State
  RxBool isLoading = false.obs;

  /// Error Message
  RxString emailError = ''.obs;

  /// Validate and Request Reset
  void validateAndRequestReset() async {
    emailError.value = '';

    try {
      isLoading.value = true;

      /// TODO: Call your API here
      await Future.delayed(const Duration(seconds: 2));

      Get.snackbar(
        "Success",
        "Reset code sent to your email",
        snackPosition: SnackPosition.BOTTOM,
      );

      Get.toNamed(Routes.OTP);
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to send reset code",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
