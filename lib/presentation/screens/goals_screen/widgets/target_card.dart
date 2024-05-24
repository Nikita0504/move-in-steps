import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:move_in_steps/domain/models/target.dart';
import 'package:move_in_steps/internal/colors.dart';
import 'package:move_in_steps/presentation/screens/goals_screen/goals_screen_controller.dart';

class TargetCard extends GetView<GoalsController> {
  final int index;
  const TargetCard({required this.index});

  @override
  Widget build(BuildContext context) {
    Target target = controller.targets[index];
    var size = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.all(10),
        width: size.width,
        height: size.height * 0.2,
        decoration: const BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      target.name,
                      style:
                          TextStyle(color: AppColors.textColor, fontSize: 20),
                    ),
                    Obx(() => Text(
                          '${target.steps} / ${target.target}',
                          style: TextStyle(
                              color: AppColors.textColor, fontSize: 15),
                        )),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Column(
                children: [
                  Obx(() => IconButton(
                      onPressed: () {
                        controller.updatePress(target, 0);
                        controller.sendMessage(index);
                      },
                      icon: Icon(
                        Icons.send,
                        color: target.press[0] == true
                            ? const Color.fromARGB(255, 88, 141, 231)
                            : Colors.white,
                      ))),
                  Obx(() => InkWell(
                        onLongPress: () {
                          target.check = 0.obs;
                          target.press[1] = false;
                        },
                        child: IconButton(
                            onPressed: () {
                              controller.updatePress(target, 1);
                              controller.removeTarget(target, index);
                            },
                            icon: Icon(
                              Icons.restore_from_trash,
                              color: target.press[1] == true
                                  ? Colors.red
                                  : Colors.white,
                            )),
                      )),
                  Obx(() => IconButton(
                      onPressed: () {
                        controller.updatePress(target, 2);
                      },
                      icon: target.press[2] == false
                          ? const Icon(
                              Icons.pause,
                              color: Colors.white,
                            )
                          : const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                            ))),
                ],
              ),
            )
          ],
        ));
  }
}
