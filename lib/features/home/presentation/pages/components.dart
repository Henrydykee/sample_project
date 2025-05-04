import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_project/core/presentation/widgets/button.dart';
import 'package:new_project/core/presentation/widgets/text_holder.dart';

class StatsCard extends StatelessWidget {
  final String title;
  final String value;
  final Color? backgroundColor;
  final Color textColor;

  const StatsCard({
    Key? key,
    required this.title,
    required this.value,
    this.backgroundColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextHolder(
              title: title,
              size: 16,
              fontWeight: FontWeight.w300,
              color: textColor),
          const SizedBox(height: 8),
          TextHolder(
            title: value,
            size: 24,
            fontWeight: FontWeight.w700,
            color: textColor,
            align: TextAlign.center,
          )
        ],
      ),
    );
  }
}

class GrantCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String amount;
  final String funder;
  final String deadline;
  final bool isEligible;
  final String score;
  final bool showImage;
  final bool showDeleteIcon;

  final Function()? onTap;
  final Function()? onDelete;

  const GrantCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.amount,
    required this.funder,
    required this.deadline,
    required this.isEligible,
    this.showDeleteIcon = false,
    this.onTap,
    this.showImage = true,
    this.onDelete,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showImage == true)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imageUrl,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        height: 160,
                        width: double.infinity,
                        color: Colors.grey[300],
                        child: const Center(
                          child: Icon(Icons.image_not_supported, size: 50),
                        ),
                      ),
                    );
                  },
                ),
              ),

            // Grant Details
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    amount,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Funder row
                  Row(
                    children: [
                      const Text(
                        'Funder',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 15),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        funder,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 13),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Deadline row
                  Row(
                    children: [
                      const Text(
                        'Deadline',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 15),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        deadline,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 13),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Recommendation Score row
                  Row(
                    children: [
                      const Text(
                        'Recommendation Score:',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 15),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color:
                              isEligible ? Colors.green[100] : Colors.red[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.circle,
                              size: 16,
                              color: isEligible ? Colors.green : Colors.red,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '$score ${isEligible ? "(Eligible)" : "(Not Eligible)"}',
                              style: TextStyle(
                                  color: isEligible
                                      ? Colors.green[800]
                                      : Colors.red[800],
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Action buttons
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GButton(
                      title: "View the grant",
                    ),
                  ),
                ),
                showDeleteIcon == true
                    ? GestureDetector(
                  onTap: onDelete,
                    child: SvgPicture.asset("assets/svg/delete_icon.svg"))
                    : Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey[300]!),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.favorite_border),
                          onPressed: () {},
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
