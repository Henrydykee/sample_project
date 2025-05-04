

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:new_project/core/presentation/widgets/text_holder.dart';
import 'package:new_project/core/utils/navigation_service.dart';
import 'package:new_project/features/explore/presentation/pages/grant_detail_screen.dart';

import '../../../home/presentation/pages/components.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(60),
            TextHolder(title: "Explore Grants",size: 24,fontWeight: FontWeight.w400,color: Colors.black,),
            Gap(19),
            Row(
              children: [
                TextHolder(title: "Showing Results for: ",size: 13,fontWeight: FontWeight.w500,color: Colors.black,),
                TextHolder(title: "Recommendation ",size: 13,fontWeight: FontWeight.w700,color: Colors.black,),
              ],
            ),
            Gap(20),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(0),
                itemCount: 20,
                shrinkWrap: true,
                itemBuilder: (c, i) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: GrantCard(
                    onTap: () => router.push(GrantDetailScreen()),
                    showImage: false,
                    imageUrl: 'assets/hunger_fighters.jpg',
                    title: 'Land O Lakes Foundation community Grants',
                    amount: '\$318,000',
                    funder: 'US Department of Justice',
                    deadline: 'Dec 19, 2023',
                    isEligible: true,
                    score: '8',
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