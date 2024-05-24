import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:move_in_steps/domain/counters/progress_counter.dart';
import 'package:move_in_steps/domain/global_controller.dart';
import '../../../../../domain/counters/distance_counter.dart';
import '../../../../../internal/colors.dart';
import './circle_progress.dart';

class WidgetCircleProgress extends GetView<GlobalController> {
  const WidgetCircleProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => CustomPaint(
          foregroundPainter: CircleProgress(
              circleProgress:
                  progressCounter(1000, (controller.steps.value * 0.7).ceil())),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                distance(controller.steps.value),
                style: const TextStyle(
                    color: AppColors.textColor, fontWeight: FontWeight.w600),
              ),
              Text(
                '${controller.steps.value} steps',
                style:
                    const TextStyle(color: AppColors.textColor, fontSize: 30),
              ),
              Text(
                '${progressCounter(1000, (controller.steps.value * 0.7).ceil()).ceil()}%',
                style: const TextStyle(
                    color: AppColors.textColor, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ));
  }
}
