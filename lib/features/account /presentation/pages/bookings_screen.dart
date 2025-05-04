import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:new_project/core/platform/color.dart';
import 'package:new_project/core/presentation/widgets/button.dart';

import '../../../../core/utils/navigation_service.dart';

class ConsultationBookingPage extends StatelessWidget {
  const ConsultationBookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Book a Consultation',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Talk to one of our specialists',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w500

                        ),
                      ),
                    ],
                  ),
                ),

                // Image Section
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Image.asset(
                      'assets/images/Image.png',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Description Text
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: const Text(
                    'With our team of specialists and an intuitive database of grants, tax credits, and business incentives, finding the right funding for your business has never been easier!',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ),

                // Book a consultation text
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: const Text(
                    'Book a 1:1 consultation call with a Pocketed Grant Specialist today to dive into your funding needs.',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ),
                Gap(36),

                GButton(
                  title: "Book a consultation",
                ),
                Gap(36),

                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, top: 16.0, bottom: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Frequently Asked Questions',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // FAQ Items
                FAQItem(
                  question: 'Why book a consultation?',
                  answer:
                      'Our grant specialists offer one-on-one consultations to help businesses find and apply for grants that are relevant to their projects. We provide personalized strategies and application guidance. To schedule a consultation, follow the booking link.',
                ),
                Gap(20),

                FAQItem(
                  question: 'How to prepare for your consultation?',
                  answer:
                      'To ensure that you get the most benefit from your consultation with our specialists, we suggest coming prepared with any ideas or questions you have about your business goals, upcoming projects, and grant questions. During the consultation, we will work with you to identify the grant programs that are the best fit for your needs, provide information on what you need to do to apply, and help you plan for grant reporting once your application has been approved. The more prepared you are for the consultation, the more we can help you get the most value from the time spent together.',
                ),
                Gap(20),

                FAQItem(
                  question: 'Next steps to book your appointment',
                  answer:
                      'To schedule your appointment with our grant specialists, simply click the provided link and complete the payment process. After payment is received, our customer success team will reach out to you to confirm the details of your consultation.',
                ),

                // Bottom spacing
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  const FAQItem({
    Key? key,
    required this.question,
    required this.answer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Color(0xFFEEEFF2).withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: newprojectColor.grey.withOpacity(0.1))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            answer,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.black87,

            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
