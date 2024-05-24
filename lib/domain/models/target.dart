import 'dart:convert';

import 'package:get/get.dart';

class Target {
  final String name;
  final int target;
  RxList<bool> press;
  RxInt check;
  RxInt steps;

  Target({
    required this.name,
    required this.target,
    required this.press,
    required this.check,
    required this.steps,
  });

  factory Target.fromJson(Map<String, dynamic> jsonData) {
    return Target(
      name: jsonData['name'],
      target: jsonData['target'],
      press: RxList<bool>.from(
          jsonData['press'].map<bool>((item) => item as bool)),
      check: RxInt(jsonData['check']),
      steps: RxInt(jsonData['steps']),
    );
  }

  static Map<String, dynamic> toMap(Target target) => {
        'name': target.name,
        'target': target.target,
        'press': target.press.toList(),
        'check': target.check.value,
        'steps': target.steps.value,
      };

  static String encode(List<Target> targets) => json.encode(
        targets
            .map<Map<String, dynamic>>((target) => Target.toMap(target))
            .toList(),
      );

  static List<Target> decode(String targets) =>
      (json.decode(targets) as List<dynamic>)
          .map<Target>((item) => Target.fromJson(item))
          .toList();
}
