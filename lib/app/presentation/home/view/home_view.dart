import 'package:boozin/app/presentation/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../data/service/google_fit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:health/health.dart';

import 'components/fitness_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final homController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   

      appBar: AppBar(
      
        automaticallyImplyLeading: false,
        title: Text(
          "Hi!",
          style: GoogleFonts.nunito(
            fontSize: 30,
            fontWeight: FontWeight.w700,
           // color: Colors.black,
          ),
        ),
      ),
      body:  GetBuilder<HomeController>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                if(!controller.installed)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
                  decoration: BoxDecoration(
                    color: Get.theme.cardColor,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                         // color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.health_and_safety,
                          size: 30,
                        //  color: Colors.white,
                        ),
                      ),
          
                      const SizedBox(height: 12),
          
                      const Text(
                        "Health Connect Required",
                        style: TextStyle(
                        //  color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
          
                      const SizedBox(height: 12),
          
                      Text(
                        "To track your steps, calories, and fitness data, "
                        "we need Health Connect installed on your device.",
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
          
                      const SizedBox(height: 20),
          
                      // Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: controller.openStore,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "Install Health Connect",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          
                const SizedBox(height: 12),
          
                metricCard(
                  title: "Steps:",
                  value: controller.steps.toString(),
                  icon: "assets/images/foot.png",
                  progress: (controller.steps / 6000).clamp(0.0, 1.0),
                  goalText: "Goal: 6,000",
                ),
          
                const SizedBox(height: 20),
          
                metricCard(
                  title: "Calories Burned:",
                  value: controller.calories.toString(),
                  icon: "assets/images/kcal.png",
                  progress: (controller.calories / 1000).clamp(0.0, 1.0),
                  goalText: "Goal: 1000",
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
