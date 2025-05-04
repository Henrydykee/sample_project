import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_project/core/presentation/widgets/button.dart';

import '../../../../core/utils/navigation_service.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: router.pop,
            child: SvgPicture.asset(
              "assets/svg/back_icon.svg",
              fit: BoxFit.scaleDown,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Free plan card
              SubscriptionPlanCard(
                planName: 'Free plan',
                price: '\$0',
                isCurrentPlan: true,
                buttonText: 'Current Plan',
                buttonColor: Colors.grey.shade400,
                features: const [
                  'Create and manage your account',
                  '2 grant recommendations per month',
                  'Option to hire a grant writer or get consultation',
                ],
                onPressed: () {},
              ),

              const SizedBox(height: 24),

              // Premium plan card
              SubscriptionPlanCard(
                planName: 'Premium plan',
                price: '\$8',
                isCurrentPlan: false,
                buttonText: 'Upgrade to premium',
                buttonColor: Colors.black87,
                features: const [
                  'See all the grants you qualify for, daily',
                  'Weekly email updates on grants you qualify for',
                  'Deadline notifications emails on saved grants',
                  'Advanced filtering by deadline, country, industry, grant size, and more',
                  'Priority access to grant writers and consultants',
                ],
                onPressed: () {
                  // Handle upgrade action
                  _showUpgradeDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showUpgradeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Upgrade to Premium'),
        content: const Text(
            'Would you like to upgrade to our Premium plan for \$8/month?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle payment process
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Upgrading to Premium...')));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black87,
            ),
            child: const Text('Upgrade Now'),
          ),
        ],
      ),
    );
  }
}

class SubscriptionPlanCard extends StatelessWidget {
  final String planName;
  final String price;
  final bool isCurrentPlan;
  final String buttonText;
  final Color buttonColor;
  final List<String> features;
  final VoidCallback onPressed;

  const SubscriptionPlanCard({
    Key? key,
    required this.planName,
    required this.price,
    required this.isCurrentPlan,
    required this.buttonText,
    required this.buttonColor,
    required this.features,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Plan header with price
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  planName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: price,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: const [
                      TextSpan(
                        text: '/mo',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1),

          // Button

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GButton(
              title: isCurrentPlan ? "Current Plan" : "Upgrade to premium",
              btnColor: isCurrentPlan ? Color(0xFFCECECE) : Colors.black,
              textColor: isCurrentPlan ? Color(0xFF898989) : Colors.white,
              showBorder: false,
            ),
          ),

          const Divider(height: 1),

          // Features list
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isCurrentPlan
                      ? 'Everything in Free plus:'
                      : 'Everything in Free plus:',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                ...features.map((feature) => FeatureItem(text: feature)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final String text;

  const FeatureItem({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 2),
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              color: Color(0xFFFAB555),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check,
              size: 10,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
