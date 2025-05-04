import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:new_project/core/platform/color.dart';
import 'package:new_project/core/presentation/widgets/button.dart';
import 'package:new_project/core/presentation/widgets/text_holder.dart';
import 'package:new_project/core/utils/navigation_service.dart';
import 'package:new_project/features/auth/presentation/pages/signup/create_account_screen.dart';

class SelectAccountTypeScreen extends StatefulWidget {
  const SelectAccountTypeScreen({super.key});

  @override
  State<SelectAccountTypeScreen> createState() =>
      _SelectAccountTypeScreenState();
}

class _SelectAccountTypeScreenState extends State<SelectAccountTypeScreen> {
  int selectedIndex = -1;

  void handleTap(int index) {
    setState(() => selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment:  MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          TextHolder(
                            title: "What would you like to do now?",
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            size: 32,
                          ),
                          Gap(8),
                          TextHolder(
                            title:
                                "Don't worry, you can still try out the other options later",
                            color: newprojectColor.grey,
                            fontWeight: FontWeight.w400,
                            size: 14,
                          ),
                          Gap(30),
                          _ActionButton(
                            imagePath: "assets/images/find.png",
                            title: "I’m here to find grants for my business",
                            isSelected: selectedIndex == 0,
                            onTap: () => handleTap(0),
                          ),
                          Gap(16),
                          _ActionButton(
                            imagePath: "assets/images/hire.png",
                            title: "I’m here to hire grants writers",
                            isSelected: selectedIndex == 1,
                            onTap: () => handleTap(1),
                          ),
                          
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  TextHolder(title: "We’ll use this info to personalize your experience.You’ll always be able to both search for grants and hire grant writers", color: newprojectColor.grey, fontWeight: FontWeight.w400, size: 12,),
                           Gap(10),
                  GButton(
                    isDisabled: selectedIndex == -1,
                    title: "Get  Started",
                    onTap: () => router.push(CreateAccountScreen()),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String title;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;

  const _ActionButton({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Colors.black : Color(0xFFD0D5DD),
            width: 1,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          children: [
            Image.asset(imagePath),
            const SizedBox(height: 8),
            TextHolder(
              title: title,
              fontWeight: FontWeight.w500,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }
}
