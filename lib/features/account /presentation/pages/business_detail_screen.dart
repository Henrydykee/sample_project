import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:new_project/core/presentation/widgets/button.dart';
import 'package:new_project/core/presentation/widgets/text_field.dart';
import 'package:new_project/core/presentation/widgets/text_holder.dart';

import '../../../../core/utils/navigation_service.dart';

class BusinessDetailScreen extends StatefulWidget {
 final  bool isEdit;

  BusinessDetailScreen({super.key, this.isEdit = false});

  @override
  State<BusinessDetailScreen> createState() => _BusinessDetailScreenState();
}

class _BusinessDetailScreenState extends State<BusinessDetailScreen> {
  @override
  Widget build(BuildContext context) {
    bool isEdit = widget.isEdit;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          if (isEdit)
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF333333),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 1,
                  ),
                ),
                child: const Text(
                  'Save changes',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
        ],
        leading: GestureDetector(
            onTap: router.pop,
            child: SvgPicture.asset(
              "assets/svg/back_icon.svg",
              fit: BoxFit.scaleDown,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextHolder(
                      title: isEdit ? "Edit Business Details" : "Business Details",
                      size: 24,
                      fontWeight: FontWeight.w700,
                    ),
                    CustomTextField(
                      title: "Company name",
                    ),
                    CustomTextField(
                      title: "Company Website",
                    ),
                    CustomTextField(
                      title: "In which country does your company operate?",
                    ),
                    CustomTextField(
                      title: "In which state is your company headquartered?",
                    ),
                    CustomTextField(
                      title: "Company status",
                    ),
                    CustomTextField(
                      title: "Company size",
                    ),
                    CustomTextField(
                      title: "Annual revenue",
                    ),
                    CustomTextField(
                      title: "Date of incorporation (if not incorporated, business start date)",
                    ),
                    CustomTextField(
                      title: "Founder demographics",
                    ),
                    CustomTextField(
                      title: "Industry",
                    ),
                    CustomTextField(
                      title: "Business type",
                    ),
                    CustomTextField(
                      title: "Founder demographics",
                    ),
                    Gap(30)

                  ],
                ),
              ),
            ),
           isEdit ? SizedBox() : Padding(
             padding: const EdgeInsets.only(bottom: 30),
             child: GButton(
                title: 'Edit business profile',
                onTap: ()=> router.push(BusinessDetailScreen(isEdit: true,)),
              ),
           )

          ],
        ),
      ),
    );
  }
}
