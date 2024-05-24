import 'dart:math';
import 'package:get/get.dart';
import 'package:move_in_steps/domain/global_controller.dart';

int stepsCounter(int x, int y, int z) {
  final GlobalController controller = Get.put(GlobalController());
  double distance = sqrt(x * x + y * y + z * z);
  double mode = distance - controller.previousDistance;
  controller.previousDistance = distance;
  if (mode > 6) {
    return 1;
  } else {
    return 0;
  }
}
