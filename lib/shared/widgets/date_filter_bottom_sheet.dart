import 'package:flutter/material.dart';
import '../helpers/date_helpers.dart';
import 'calendar_header.dart';
import 'calendar_grid.dart';
import 'month_navigation.dart';

class DateFilterBottomSheet extends StatefulWidget {
  final DateTime? initialDate;
  final Function(DateTime? selectedDate) onDateSelected;

  const DateFilterBottomSheet({
    super.key,
    this.initialDate,
    required this.onDateSelected,
  });

  @override
  State<DateFilterBottomSheet> createState() => _DateFilterBottomSheetState();
}

class _DateFilterBottomSheetState extends State<DateFilterBottomSheet> {
  DateTime? _selectedDate;
  late DateTime _currentMonth;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
    _currentMonth = widget.initialDate ?? DateHelpers.getToday();
  }

  void handlePreviousMonth() {
    setState(() {
      _currentMonth = DateHelpers.getPreviousMonth(_currentMonth);
    });
  }

  void handleNextMonth() {
    setState(() {
      _currentMonth = DateHelpers.getNextMonth(_currentMonth);
    });
  }

  void handleTodayTap() {
    setState(() {
      _selectedDate = DateHelpers.getToday();
      _currentMonth = DateHelpers.getToday();
    });
  }

  void handleDateTap(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
    widget.onDateSelected(_selectedDate);
    Navigator.pop(context);
  }

  void handleClearFilter() {
    widget.onDateSelected(null);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          CalendarHeader(
            onTodayTap: handleTodayTap,
            onCloseTap: handleClearFilter,
          ),
          MonthNavigation(
            currentMonth: _currentMonth,
            onPreviousMonth: handlePreviousMonth,
            onNextMonth: handleNextMonth,
          ),
          CalendarGrid(
            currentMonth: _currentMonth,
            selectedDate: _selectedDate,
            onDateTap: handleDateTap,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
