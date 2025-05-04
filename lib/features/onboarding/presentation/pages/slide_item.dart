import 'package:flutter/material.dart';
import 'package:new_project/features/onboarding/data/models/slide_model.dart';


class SliderItem extends StatelessWidget {
  final Slide slide;
  

  const SliderItem({super.key, required this.slide});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          slide.title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        const SizedBox(height: 20),
        Text(
          slide.description,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Color(0xFF667085),fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}


class SliderImage extends StatelessWidget {
  final Slide slide;
  

  const SliderImage({super.key, required this.slide});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      slide.image
    );
  }
}

