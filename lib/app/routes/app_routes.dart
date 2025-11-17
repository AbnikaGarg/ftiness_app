import 'package:boozin/app/presentation/home/bindings/home_bindings.dart';
import 'package:boozin/app/presentation/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_device_apps/flutter_device_apps.dart';
import '../presentation/splash/view/splash_view.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;

  static const SPLASHSCREEN = _Paths.SPLASHSCREEN;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const SPLASHSCREEN = '/';
}

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: AppPages.INITIAL,

      page: () {
        return const SplashScreen();
      },
    ),
    GetPage(
      name: Routes.HOME,
      binding: HomeBindings(),
      transitionDuration: Duration(milliseconds: 600),
      page: () {
        return HomeScreen();
      },

      transition: Transition.fadeIn, // choose your animation
    ),
  ];
}
