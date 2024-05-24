import 'package:get/get.dart';
import 'package:move_in_steps/domain/models/target.dart';
import 'package:move_in_steps/domain/save_targets.dart';
import 'package:move_in_steps/domain/service/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoalsController extends GetxController {
  RxList<Target> targets = <Target>[].obs;
  void updatePress(Target target, int index) {
    if (target.press[index] == false) {
      target.press[index] = true;
    } else {
      target.press[index] = false;
    }
    saveTargets(targets);
    update();
  }

  void removeTarget(Target target, int index) {
    target.check++;
    if (target.check == 2) {
      targets.removeAt(index);
      target.check = 0.obs;
      saveTargets(targets);
    }
  }

  void addSteps(int step) {
    if (targets.length != 0) {
      for (int i = 0; i < targets.length; i++) {
        Target target = targets[i];
        if (target.press[2] == false) {
          sendMessage(i);
          targets[i].steps += step;
        }
      }
    }
    update();
  }

  void addGoal(
    String name,
    int target,
  ) {
    targets.add(
      Target(
          name: name,
          target: target,
          press: [false, false, false].obs,
          check: 0.obs,
          steps: 0.obs),
    );
    saveTargets(targets);
    update();
  }

  void sendMessage(
    int index,
  ) {
    Target target = targets[index];
    if (target.press[0] == true) {
      if (target.steps > target.target) {
        target.press[0] = false;
        update();
      }
      Notifications().showNotification(
        id: index,
        title: target.name,
        body: 'progress ${target.steps} / ${target.target}',
      );
    }
  }

  @override
  void onInit() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String targetsString = await prefs.getString('targets') ?? '';
    targets = Target.decode(targetsString).obs;
    print('targets: $targets');
    super.onInit();
  }
}
