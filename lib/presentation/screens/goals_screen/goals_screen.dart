import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:move_in_steps/internal/colors.dart';
import 'package:move_in_steps/presentation/screens/goals_screen/goals_screen_controller.dart';
import 'package:move_in_steps/presentation/screens/goals_screen/widgets/target_card.dart';

class GoalsScreen extends GetView<GoalsController> {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    TextEditingController name = TextEditingController();
    TextEditingController? target = TextEditingController();
    return Stack(
      children: <Widget>[
        Align(
            alignment: Alignment.topCenter,
            child: Obx(
              () => SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: List.generate(controller.targets.length,
                      (index) => TargetCard(index: index)),
                ),
              ),
            )),
        Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                        backgroundColor: AppColors.backgroundColor,
                        title: const Text(
                          "Сreate a goal",
                          style: TextStyle(color: AppColors.textColor),
                        ),
                        content: Container(
                          height: size.height * 0.2,
                          child: Column(
                            children: [
                              TextField(
                                style:
                                    const TextStyle(color: AppColors.textColor),
                                controller: name,
                                decoration: const InputDecoration(
                                  labelStyle:
                                      TextStyle(color: AppColors.textColor),
                                  border: OutlineInputBorder(),
                                  labelText: 'Name of the goal',
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              TextField(
                                style:
                                    const TextStyle(color: AppColors.textColor),
                                controller: target,
                                decoration: const InputDecoration(
                                  labelStyle:
                                      TextStyle(color: AppColors.textColor),
                                  border: OutlineInputBorder(),
                                  labelText: 'Goal by steps',
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Get.back(),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: AppColors.textColor),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              controller.addGoal(
                                name.text,
                                int.parse(target.text),
                              );
                              Get.back();
                            },
                            child: const Text(
                              'OK',
                              style: TextStyle(color: AppColors.textColor),
                            ),
                          ),
                        ],
                      )),
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: size.width * 0.175,
                  height: size.height * 0.175,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 71, 70, 70),
                  ),
                  margin: EdgeInsets.only(right: size.width * 0.05),
                  child: const Icon(
                    Icons.add,
                    color: AppColors.textColor,
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
