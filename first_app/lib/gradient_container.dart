// import 'package:first_app/styled_text.dart';
import 'package:first_app/dice_roller.dart';
import 'package:flutter/material.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  final List<Color> backgroundColor;

  const GradientContainer({super.key, required this.backgroundColor});

  const GradientContainer.purple({super.key, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: backgroundColor,
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      // child: const StyledText('Hello World'),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
