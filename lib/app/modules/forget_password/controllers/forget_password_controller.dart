import 'dart:async';
import 'package:campers_closet/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  RxBool isLoading = false.obs;
  RxBool isLoadingOtp = false.obs;

  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;
  RxString confirmPasswordError = ''.obs;

  RxString userEmail = ''.obs;

  RxBool canResend = false.obs;
  RxInt secondsRemaining = 60.obs;

  Timer? timer;

  String get formattedTime {
    final minutes = (secondsRemaining.value ~/ 60).toString().padLeft(2, '0');
    final seconds = (secondsRemaining.value % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  void validateAndRequestReset() async {
    emailError.value = '';
    userEmail.value = emailController.text.trim();

    try {
      isLoading.value = true;

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

  void startTimer() {
    canResend.value = false;
    secondsRemaining.value = 60;

    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
      } else {
        canResend.value = true;
        timer.cancel();
      }
    });
  }

  void onOtpChanged(String value) {}

  Future<void> validateAndSubmitOtp() async {
    final otp = otpController.text;

    if (otp.length != 4) {
      Get.snackbar("Error", "Please enter valid OTP");
      return;
    }

    try {
      isLoadingOtp.value = true;

      await Future.delayed(const Duration(seconds: 2));

      Get.snackbar("Success", "OTP Verified");

      Get.offNamed(Routes.RESET_VIEW);
    } catch (e) {
      Get.snackbar("Error", "OTP verification failed");
    } finally {
      isLoadingOtp.value = false;
    }
  }

  Future<void> resendOtp() async {
    try {
      isLoadingOtp.value = true;

      await Future.delayed(const Duration(seconds: 2));

      otpController.clear();
      startTimer();

      Get.snackbar("Success", "OTP sent again");
    } catch (e) {
      Get.snackbar("Error", "Failed to resend OTP");
    } finally {
      isLoadingOtp.value = false;
    }
  }

  Future<void> resetPassword() async {
    passwordError.value = '';
    confirmPasswordError.value = '';

    try {
      isLoading.value = true;

      await Future.delayed(const Duration(seconds: 2));

      Get.snackbar(
        "Success",
        "Password reset successfully",
        snackPosition: SnackPosition.BOTTOM,
      );

      Get.offNamed(Routes.BACKLOGIN);
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to reset password",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    otpController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    timer?.cancel();
    super.onClose();
  }
}
