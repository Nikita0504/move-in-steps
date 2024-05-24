import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:move_in_steps/domain/counters/steps_counter.dart';
import 'package:sensors_plus/sensors_plus.dart';
import '../presentation/screens/goals_screen/goals_screen_controller.dart';
import '../presentation/screens/home_screen/home_screen_controller.dart';
import '../presentation/screens/main_screen.dart/main_screen_controller.dart';

class GlobalController extends GetxController
    with SingleGetTickerProviderMixin {
  final MainScreenController navigationBarController =
      Get.put(MainScreenController());
  final HomeController homeController = Get.put(HomeController());
  final GoalsController goalsController = Get.put(GoalsController());

  AnimationController? animationController;
  Animation? animation;
  RxInt steps = 0.obs;
  RxDouble gyroX = 0.0.obs;
  RxDouble gyroY = 0.0.obs;
  RxDouble gyroZ = 0.0.obs;
  double previousDistance = 0.0;

  @override
  void onInit() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = Tween<double>(begin: 0, end: 100).animate(animationController!)
      ..addListener(() {});

    accelerometerEvents.listen((AccelerometerEvent event) {
      gyroX = event.x.obs;
      gyroY = event.y.obs;
      gyroZ = event.z.obs;
      int step = stepsCounter(
          gyroX.value.ceil(), gyroY.value.ceil(), gyroZ.value.ceil());
      steps + step;

      goalsController.addSteps(step);

      update();
    });
    super.onInit();
  }
}
