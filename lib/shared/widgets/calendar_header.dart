import 'package:flutter/material.dart';

class CalendarHeader extends StatelessWidget {
  final VoidCallback onTodayTap;
  final VoidCallback onCloseTap;

  const CalendarHeader({
    super.key,
    required this.onTodayTap,
    required this.onCloseTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          TextButton(
            onPressed: onTodayTap,
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xFFE8EAF6),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              '今日',
              style: TextStyle(
                color: Color(0xFF3F51B5),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Spacer(),
          const Text(
            '日付選択',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: onCloseTap,
            icon: const Icon(Icons.close, color: Colors.black54),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            tooltip: 'フィルターをクリア',
          ),
        ],
      ),
    );
  }
}

