import 'package:get/get.dart';

class MainScreenController extends GetxController {
  RxInt curentIndex = 0.obs;

  void updateIndex(int index) {
    curentIndex.value = index;
    update();
  }
}
