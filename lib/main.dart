import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:move_in_steps/domain/global_controller.dart';
import 'package:move_in_steps/domain/service/flutter_local_notifications.dart';
import 'package:move_in_steps/internal/application.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Notifications().initNotification();
  Get.put(GlobalController());
  runApp(const Application());
}
