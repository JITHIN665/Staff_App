/// Helper functions for date formatting and calendar logic
class DateHelpers {
  DateHelpers._();

  /// Format date as "YYYY年MM月"
  static String formatYearMonth(DateTime date) {
    return '${date.year}年${date.month}月';
  }

  /// Format date as "MM/DD"
  static String formatMonthDay(DateTime date) {
    return '${date.month}/${date.day}';
  }

  /// Format date as "YYYY/MM/DD"
  static String formatYearMonthDay(DateTime date) {
    return '${date.year}/${date.month}/${date.day}';
  }

  /// Get previous month
  static DateTime getPreviousMonth(DateTime date) {
    return DateTime(date.year, date.month - 1);
  }

  /// Get next month
  static DateTime getNextMonth(DateTime date) {
    return DateTime(date.year, date.month + 1);
  }

  /// Check if two dates are the same day
  static bool isSameDay(DateTime? date1, DateTime? date2) {
    if (date1 == null || date2 == null) return false;
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  /// Check if date is today
  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return isSameDay(date, now);
  }

  /// Check if date is in current month
  static bool isCurrentMonth(DateTime date, DateTime currentMonth) {
    return date.month == currentMonth.month && date.year == currentMonth.year;
  }

  /// Get first day of month
  static DateTime getFirstDayOfMonth(DateTime date) {
    return DateTime(date.year, date.month, 1);
  }

  /// Get last day of month
  static DateTime getLastDayOfMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0);
  }

  /// Get weekday (Sunday = 0, Monday = 1, etc.)
  static int getWeekday(DateTime date) {
    return date.weekday % 7;
  }

  /// Generate calendar days for a month view
  /// Returns list of all dates to display in calendar grid
  static List<DateTime> generateCalendarDays(DateTime currentMonth) {
    final firstDayOfMonth = getFirstDayOfMonth(currentMonth);
    final lastDayOfMonth = getLastDayOfMonth(currentMonth);
    final firstWeekday = getWeekday(firstDayOfMonth);
    
    final days = <DateTime>[];
    
    // Add days from previous month to fill the first week
    for (int i = 0; i < firstWeekday; i++) {
      final prevMonthDay = firstDayOfMonth.subtract(Duration(days: firstWeekday - i));
      days.add(prevMonthDay);
    }
    
    // Add all days of current month
    for (int day = 1; day <= lastDayOfMonth.day; day++) {
      days.add(DateTime(currentMonth.year, currentMonth.month, day));
    }
    
    // Add days from next month to complete the grid
    final remainingCells = (7 - (days.length % 7)) % 7;
    for (int i = 1; i <= remainingCells; i++) {
      days.add(DateTime(currentMonth.year, currentMonth.month + 1, i));
    }
    
    return days;
  }

  /// Split days into weeks (rows of 7 days)
  static List<List<DateTime>> groupDaysIntoWeeks(List<DateTime> days) {
    final weeks = <List<DateTime>>[];
    
    for (int i = 0; i < days.length; i += 7) {
      final endIndex = (i + 7 < days.length) ? i + 7 : days.length;
      weeks.add(days.sublist(i, endIndex));
    }
    
    return weeks;
  }

  /// Get Japanese weekday labels
  static List<String> getWeekdayLabels() {
    return ['日', '月', '火', '水', '木', '金', '土'];
  }

  /// Get today's date (without time)
  static DateTime getToday() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }
}

