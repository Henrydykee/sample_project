import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:new_project/core/presentation/widgets/button.dart';
import 'package:new_project/core/presentation/widgets/text_holder.dart';
import 'package:new_project/core/utils/navigation_service.dart';
import 'package:new_project/features/explore/presentation/pages/score_card.dart';
import '../../../home/presentation/pages/components.dart';

class GrantDetailScreen extends StatefulWidget {
  const GrantDetailScreen({super.key});

  @override
  State<GrantDetailScreen> createState() => _GrantDetailScreenState();
}

class _GrantDetailScreenState extends State<GrantDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: router.pop,
            child: SvgPicture.asset("assets/svg/back_icon.svg",fit: BoxFit.scaleDown,)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StatsCard(
              title: 'You’re viewing',
              value: 'Land O Lakes Foundation community Grants',
              backgroundColor: Colors.grey[800],
              textColor: Colors.white,
            ),
            Gap(16),
            RecommendationScoreCard(),
            Gap(16),
            GButton(
              title: "Apply for this grant",
              textColor: Colors.black,
              btnColor: Colors.white,
            ),
            Gap(16),
            GrantWriterLink(),
            Gap(20),
            Divider(
              thickness: 2,
            ),
            Gap(20),
            TextHolder(
              title: "About the Grant",
              size: 20,
              fontWeight: FontWeight.w700,
            ),
            Gap(26),
            _ProgramInfoCard(
              title: "Program url:",
              description:
                  "One of the things students love the most about this course is the free ebook that is full-packed with resources. But as you may have noticed, that ebook is quickly becoming outdated, which is why I published a resources page that gets regular updates :)",
            )
          ],
        ),
      ),
    );
  }
}

class _ProgramInfoCard extends StatelessWidget {
  final String title;
  final String description;
  final Color backgroundColor;
  final Color borderColor;

  const _ProgramInfoCard({
    required this.title,
    required this.description,
    this.backgroundColor = const Color(0xFFE4E4E7),
    this.borderColor = const Color(0xFFD1D1D1),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backgroundColor,
        border: Border.all(color: borderColor.withOpacity(0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextHolder(
              title: title,
              size: 16,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 16), // replacing Gap with SizedBox
            TextHolder(
              title: description,
              size: 14,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF767676),
            ),
          ],
        ),
      ),
    );
  }
}
