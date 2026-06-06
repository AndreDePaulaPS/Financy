extension DateTimeExtension on DateTime {
  String get relativeDate {
    final now = DateTime.now();

    final today = DateTime(
      now.year,
      now.month,
      now.day,
    );

    final date = DateTime(
      year,
      month,
      day,
    );

    final difference = today.difference(date).inDays;

    if (difference == 0) {
      return 'Today';
    }

    if (difference == 1) {
      return 'Yesterday';
    }

    return '${day.toString().padLeft(2, '0')}/'
        '${month.toString().padLeft(2, '0')}/'
        '$year';
  }

  
}

extension DateTimeGreetingExtension on DateTime {
  String get periodOfDay {
    final hour = this.hour;

    if (hour >= 5 && hour < 12) {
      return 'Good Morning';
    }

    if (hour >= 12 && hour < 18) {
      return 'Good Afternoon';
    }

    return 'Good Evening';
  }
}