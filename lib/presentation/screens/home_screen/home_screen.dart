import 'package:flutter/material.dart';
import 'package:move_in_steps/presentation/screens/home_screen/widgets/additional_information.dart';
import 'widgets/circle_progress/widget_cicle_progress.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        const Align(
          alignment: Alignment.center,
          child: WidgetCircleProgress(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              margin: EdgeInsets.only(bottom: size.height * 0.15),
              child: const AdditionalInformation()),
        ),
      ],
    );
  }
}
