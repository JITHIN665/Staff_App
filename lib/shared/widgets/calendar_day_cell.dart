import 'package:flutter/material.dart';
import '../helpers/date_helpers.dart';

class CalendarDayCell extends StatelessWidget {
  final DateTime date;
  final DateTime currentMonth;
  final DateTime? selectedDate;
  final VoidCallback onTap;

  const CalendarDayCell({
    super.key,
    required this.date,
    required this.currentMonth,
    required this.selectedDate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isCurrentMonth = DateHelpers.isCurrentMonth(date, currentMonth);
    final isSelected = DateHelpers.isSameDay(date, selectedDate);
    final isCurrentDay = DateHelpers.isToday(date);
    
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 44,
          decoration: BoxDecoration(
            color: isSelected 
                ? const Color(0xFF1A237E) 
                : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '${date.day}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: isCurrentDay ? FontWeight.bold : FontWeight.normal,
                color: isSelected
                    ? Colors.white
                    : isCurrentMonth
                        ? Colors.black87
                        : Colors.grey[400],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

