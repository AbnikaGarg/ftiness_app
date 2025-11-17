import 'package:boozin/app/presentation/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:lottie/lottie.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
  

    return Scaffold(
     

      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Lottie.asset(
                controller.animationGif,
                repeat: false,
                fit: BoxFit.cover,
              ),
            ),
          
            Obx(
              () => Positioned(
                bottom: 0,
                child: AnimatedOpacity(
                  opacity: controller.textOpacity.value,

                  duration: const Duration(
                    milliseconds: 600,
                  ), // fade-in duration
                  child: Text(
                    "Fitness",
                    style: GoogleFonts.nunito(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
