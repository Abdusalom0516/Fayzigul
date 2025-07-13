import 'package:intl/intl.dart';

String formatDate({required DateTime date}) {
  final day = date.day;
  final suffix = getDaySuffix(day);
  final monthYear = DateFormat('MMMM yyyy').format(date);
  return '$day$suffix $monthYear';
}

String getDaySuffix(int day) {
  if (day >= 11 && day <= 13) {
    return 'th';
  }
  switch (day % 10) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}
