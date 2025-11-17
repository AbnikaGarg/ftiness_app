import 'dart:async' show Timer;

import 'package:flutter_device_apps/flutter_device_apps.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/service/google_fit.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    loadGoogleFit();
    super.onInit();
  }

  int steps = 0;
  double calories = 0;

  bool loading = true;

  final String _healthConnectUrl =
      "https://play.google.com/store/apps/details?id=com.google.android.apps.healthdata";

  Future<void> openStore() async {
    final uri = Uri.parse(_healthConnectUrl);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  Future<bool> isHealthConnectInstalled() async {
    final apps = await FlutterDeviceApps.listApps();
    return apps.any(
      (app) => app.packageName == "com.google.android.apps.healthdata"|| app.packageName == "com.google.android.apps.fitness",
    );
  }

  bool installed = false;

  Future<void> loadGoogleFit() async {
    final service = GoogleFitService();
    installed = await isHealthConnectInstalled();

    bool permission = await service.requestPermission();

    if (!permission) {
      final data = await service.fetchTodayData();

      steps = data["steps"];
      calories = data["calories"];
      loading = false;
      print(data);
      update();
    } else {
      loading = false;
      update();
    }
  }
}
