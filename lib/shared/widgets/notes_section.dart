import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class NotesSection extends StatelessWidget {
  final String? notes;

  const NotesSection({
    super.key,
    this.notes,
  });

  @override
  Widget build(BuildContext context) {
    if (notes == null || notes!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.edit_outlined,
              size: 20,
              color: AppTheme.textSecondaryColor,
            ),
            const SizedBox(width: 12),
            Text(
              'メモ',
              style: AppTheme.labelMedium(
                color: AppTheme.textSecondaryColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppTheme.borderColor),
          ),
          child: Text(
            notes!,
            style: AppTheme.bodyMedium(),
          ),
        ),
      ],
    );
  }
}

