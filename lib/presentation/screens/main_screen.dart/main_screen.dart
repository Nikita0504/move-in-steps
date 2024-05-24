import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:move_in_steps/internal/colors.dart';
import 'package:move_in_steps/presentation/screens/goals_screen/goals_screen.dart';
import 'package:move_in_steps/presentation/screens/home_screen/home_screen.dart';
import 'package:move_in_steps/presentation/screens/main_screen.dart/main_screen_controller.dart';
import 'package:move_in_steps/presentation/screens/main_screen.dart/widgets/bottom_navigation_bar.dart';

class MainScreen extends GetView<MainScreenController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        bottomNavigationBar: GlobalBottoNavigationBar(),
        body: SafeArea(
          child: Obx(
            () => <Widget>[
              const HomeScreen(),
              const GoalsScreen(),
            ][controller.curentIndex.value],
          ),
        ));
  }
}
