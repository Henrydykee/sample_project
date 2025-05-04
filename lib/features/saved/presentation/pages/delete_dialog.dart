

import 'package:flutter/material.dart';
import 'package:new_project/core/presentation/widgets/button.dart';

class DeleteDialog extends StatelessWidget {
  final VoidCallback onDelete;

  const DeleteDialog({super.key, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Title
            Text(
              'Delete This Grant',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),

            /// Description
            Text(
              'If you proceed with this action, this grant will be removed from your list of saved grants permanently.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 24),

            /// Delete Button
            GButton(
              title: "Delete",
            )
          ],
        ),
      ),
    );
  }
}
