
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:new_project/core/presentation/widgets/text_holder.dart';
import 'package:new_project/core/utils/navigation_service.dart';
import 'package:new_project/features/explore/presentation/pages/grant_detail_screen.dart';

import '../../../home/presentation/pages/components.dart';
import 'delete_dialog.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(50),
            TextHolder(title: "Saved Grants",size: 24,fontWeight: FontWeight.w700,color: Colors.black,),
            Gap(20),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(0),
                itemCount: 20,
                shrinkWrap: true,
                itemBuilder: (c, i) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: GrantCard(
                    showImage: false,
                    onTap: ()=> router.push(GrantDetailScreen()),
                    showDeleteIcon: true,
                    onDelete: (){
                      showDialog(
                        context: context,
                        builder: (context) => DeleteDialog(
                          onDelete: () {
                            Navigator.of(context).pop();
                            // Your delete logic here
                          },
                        ),
                      );
                    },
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