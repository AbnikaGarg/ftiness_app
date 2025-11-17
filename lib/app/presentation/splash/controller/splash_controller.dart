import 'dart:async' show Timer;
import 'dart:ui';
import 'package:boozin/app/routes/app_routes.dart';
import 'package:get/get.dart';
import '../../home/view/home_view.dart';

class SplashController extends GetxController {
  final animationGif = Get.theme.brightness == Brightness.dark
      ? "assets/images/blackthemeLogo.json"
      : "assets/images/logo2.json";
  RxDouble textOpacity = 0.0.obs;
  @override
  void onReady() {
    super.onReady();

    Future.delayed(const Duration(seconds: 2), () {
      textOpacity.value = 1.0;
      update();
    });
    Timer(const Duration(seconds: 4), () {
      Get.offAndToNamed(Routes.HOME);
    });
    // }
  }
}
