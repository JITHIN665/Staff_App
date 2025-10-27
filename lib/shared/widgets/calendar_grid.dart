import 'package:flutter/material.dart';
import '../helpers/date_helpers.dart';
import 'calendar_day_cell.dart';

class CalendarGrid extends StatelessWidget {
  final DateTime currentMonth;
  final DateTime? selectedDate;
  final Function(DateTime date) onDateTap;

  const CalendarGrid({
    super.key,
    required this.currentMonth,
    required this.selectedDate,
    required this.onDateTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: DateHelpers.getWeekdayLabels()
          .map((day) => Expanded(
                child: Center(
                  child: Text(
                    day,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ))
          .toList(),
    ),
          const SizedBox(height: 12),
          
          ...buildCalendarRows(),
        ],
      ),
    );
  }



  List<Widget> buildCalendarRows() {
    final days = DateHelpers.generateCalendarDays(currentMonth);
    final weeks = DateHelpers.groupDaysIntoWeeks(days);
    
    return weeks.map((week) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: week.map((date) {
            return CalendarDayCell(
              date: date,
              currentMonth: currentMonth,
              selectedDate: selectedDate,
              onTap: () => onDateTap(date),
            );
          }).toList(),
        ),
      );
    }).toList();
  }
}

