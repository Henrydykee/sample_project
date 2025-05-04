

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:new_project/core/platform/color.dart';
import 'package:new_project/core/utils/navigation_service.dart';
import 'package:new_project/features/account%20/presentation/pages/business_detail_screen.dart';
import 'package:new_project/features/account%20/presentation/pages/personal_detail_screen.dart';
import 'package:new_project/features/account%20/presentation/pages/subscription_screen.dart';

import '../../../../core/presentation/widgets/text_holder.dart';
import 'bookings_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(50),
            TextHolder(title: "My Profile",size: 24,fontWeight: FontWeight.w700,color: Colors.black,),
            Gap(30),
            TextHolder(title: "My Account",size: 12,fontWeight: FontWeight.w700,color: Colors.black,),
            Gap(10),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: newprojectColor.grey.withOpacity(0.3)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
                child: Column(
                  spacing: 20,
                  children: [
                    _PersonalInfoTile(title: 'Personal Details', icon: 'assets/svg/user.svg',
                    onTap: ()=> router.push(PersonalDetailScreen()),
                    ),
                    _PersonalInfoTile(title: 'Business Details', icon: 'assets/svg/brief_case.svg',
                      onTap: ()=> router.push(BusinessDetailScreen()),
                    ),
                    _PersonalInfoTile(title: 'My Subscription', icon: 'assets/svg/subscription.svg',
                    onTap: ()=> router.push(SubscriptionScreen()),
                    ),
                    _PersonalInfoTile(title: 'Hire a grant writer', icon: 'assets/svg/arcticons_tagwriter.svg',
                    onTap: () => router.push(ConsultationBookingPage()) ,
                    ),
                    _PersonalInfoTile(title: 'Log out', icon: 'assets/svg/log-out.svg',),
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}




class _PersonalInfoTile extends StatelessWidget {
  final VoidCallback? onTap;
  final String icon;
  final String title;

  const _PersonalInfoTile({ this.onTap , required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        spacing: 20,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(icon),
                  const SizedBox(width: 8),
                  TextHolder(title: title,size: 16,fontWeight: FontWeight.w400,)
                ],
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
          title == "Log out" ? SizedBox() : Divider(thickness: 1),
        ],
      ),
    );
  }
}
