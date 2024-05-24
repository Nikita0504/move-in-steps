import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:move_in_steps/presentation/screens/main_screen.dart/main_screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
