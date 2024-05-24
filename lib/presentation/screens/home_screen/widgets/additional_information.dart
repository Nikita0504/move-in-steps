import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:move_in_steps/domain/global_controller.dart';
import '../../../../internal/colors.dart';

class AdditionalInformation extends GetView<GlobalController> {
  const AdditionalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.all(5),
        width: size.width,
        height: size.height * 0.1,
        child: Obx(
          () => Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: size.width * 0.1),
                  child: Column(
                    children: [
                      Text(
                        '${(controller.steps.value * 0.7).ceil()}/1000m',
                        style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: size.width * 0.0525,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Progress',
                        style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: size.width * 0.0525,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  color: Colors.white,
                  width: 1,
                  height: size.height,
                ),
              ),
              Align(
                child: Container(
                  margin: EdgeInsets.only(left: size.width * 0.5),
                  child: Column(
                    children: [
                      Text(
                        '${(controller.steps.value * 0.1).ceil()} cal',
                        style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: size.width * 0.0525,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Сalories',
                        style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: size.width * 0.0525,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
