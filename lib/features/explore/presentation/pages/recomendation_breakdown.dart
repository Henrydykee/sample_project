import 'package:flutter/material.dart';

void showRecommendationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        insetPadding: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.8,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Close Button
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              // Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Recommendation Score Breakdown',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16),

              // Scrollable content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      ...[
                        'Location',
                        'Sector',
                        'Country',
                        'Age',
                        'Sex',
                      ].map((label) => _buildScoreItem(label)).toList(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildScoreItem(String label) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          Text('2', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
      const SizedBox(height: 4),
      Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Accumsan a, sit rutrum nunc interdum interdum nibh. Maecenas egestas commodo mattis at mauris libero.',
        style: TextStyle(fontSize: 13, color: Colors.grey[700]),
      ),
      const Divider(height: 24),
    ],
  );
}
