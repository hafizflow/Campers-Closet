import 'package:campers_closet/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {

  void startTimer() {
    Future.delayed(const Duration(seconds: 1), jumpNextScreen);
  }

  void jumpNextScreen() {
    Get.offAllNamed(Routes.ONBOARDING); 
  }
}
