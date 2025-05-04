import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_project/features/explore/presentation/pages/recomendation_breakdown.dart';

class RecommendationScoreCard extends StatelessWidget {
  const RecommendationScoreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF7E9), // light cream background
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFFE7C37D), // subtle border
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Recommendation Score',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '5',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'You are barely eligible to apply for this grant',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  showRecommendationDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF4B740), // mustard yellow
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  'See Score breakdown',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
class GrantWriterLink extends StatelessWidget {
  const GrantWriterLink({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle navigation or open external link
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Hire a Grant Writer to Improve Your Chances',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(width: 4),
          SvgPicture.asset("assets/svg/link.svg")
        ],
      ),
    );
  }
}
