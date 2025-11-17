import 'package:get/get.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

class GoogleFitService {
  final _health = Health();

  /// Permissions we need
  final List<HealthDataType> types = [
    HealthDataType.STEPS,
    HealthDataType.ACTIVE_ENERGY_BURNED,
    HealthDataType.HEART_RATE,
    HealthDataType.SLEEP_SESSION,
  ];

  final List<HealthDataAccess> permissions = [
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
  ];

  Future<bool> requestPermission() async {
    if (GetPlatform.isAndroid) {
      await Permission.activityRecognition.request();
    }

    return await _health.requestAuthorization(types, permissions: permissions);
  }

  Future<Map<String, dynamic>> fetchTodayData() async {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, now.day, 0, 0, 0);
    int? steps = await _health.getTotalStepsInInterval(start, now);

    List<HealthDataPoint> energy = await _health.getHealthDataFromTypes(
      types: [
        HealthDataType.HEART_RATE,
        HealthDataType.STEPS,
        HealthDataType.SLEEP_ASLEEP,
      ],
      startTime: start,
      endTime: now,
    );

    double calories = 0;
    for (var e in energy) {
      calories += (e.value as NumericHealthValue).numericValue;
    }

    return {"steps": steps ?? 0, "calories": calories};
  }
}
