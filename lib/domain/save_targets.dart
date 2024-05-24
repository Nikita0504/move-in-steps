import 'package:move_in_steps/domain/models/target.dart';
import 'package:shared_preferences/shared_preferences.dart';

void saveTargets(List<Target> targets) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String encodedData = Target.encode(targets);
  await prefs.setString('targets', encodedData);
}
