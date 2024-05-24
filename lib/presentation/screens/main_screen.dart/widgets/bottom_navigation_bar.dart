import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:move_in_steps/internal/colors.dart';
import 'package:move_in_steps/presentation/screens/main_screen.dart/main_screen_controller.dart';

class GlobalBottoNavigationBar extends GetView<MainScreenController> {
  const GlobalBottoNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => NavigationBarTheme(
          data: NavigationBarThemeData(
              labelTextStyle: MaterialStateProperty.all(
                  const TextStyle(color: AppColors.textColor))),
          child: NavigationBar(
              backgroundColor: Color.fromARGB(255, 63, 65, 66),
              indicatorColor: Color.fromARGB(255, 133, 132, 130),
              onDestinationSelected: (value) {
                controller.updateIndex(value);
              },
              selectedIndex: controller.curentIndex.value,
              destinations: const <Widget>[
                NavigationDestination(
                  selectedIcon: Icon(
                    Icons.home,
                    color: AppColors.textColor,
                  ),
                  icon: Icon(
                    Icons.home_outlined,
                    color: AppColors.textColor,
                  ),
                  label: 'Home',
                ),
                NavigationDestination(
                    selectedIcon: Icon(
                      Icons.list_alt_outlined,
                      color: AppColors.textColor,
                    ),
                    icon: Icon(
                      Icons.list_alt_rounded,
                      color: AppColors.textColor,
                    ),
                    label: 'Goals'),
              ]),
        ));
  }
}
