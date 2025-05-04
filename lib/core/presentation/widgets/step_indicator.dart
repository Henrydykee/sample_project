import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final Color activeColor;
  final Color inactiveColor;
  final Color completedColor;
  final double height;
  final double spacing;
  final TextStyle labelStyle;

  const StepIndicator({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.grey,
    this.completedColor = Colors.black,
    this.height = 4.0,
    this.spacing = 8.0,
    this.labelStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: List.generate(totalSteps, (index) {
            final isActive = index < currentStep;
            final isCompleted = index < currentStep - 1;
            final isCurrent = index == currentStep - 1;
            
            return Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: height,
                      decoration: BoxDecoration(
                        color: isActive ? (isCompleted ? completedColor : activeColor) : inactiveColor,
                        borderRadius: BorderRadius.circular(height / 2),
                      ),
                    ),
                  ),
                  if (index < totalSteps - 1) SizedBox(width: spacing),
                ],
              ),
            );
          }),
        ),
        const SizedBox(height: 8),
        Text(
          "Step $currentStep/$totalSteps",
          style: labelStyle,
        ),
      ],
    );
  }
}