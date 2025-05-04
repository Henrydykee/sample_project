import 'package:flutter/material.dart';

class SlideDots extends StatelessWidget {
  final bool isActive;

  const SlideDots({this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: isActive ? 16 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
