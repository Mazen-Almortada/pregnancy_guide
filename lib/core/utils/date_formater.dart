import 'package:intl/intl.dart';

String? formatDateTime(dynamic date) {
  if (date == null) {
    return date;
  }
  if (date is DateTime) {
    return DateFormat('yyyy-MM-dd').format(date);
  }
  DateTime dateTime = DateTime.parse(date);
  String formattedDateTime = DateFormat('yyyy-MM-dd').format(dateTime);
  return formattedDateTime;
}

String getDayName(DateTime date) {
  String dayName = DateFormat('EEEE').format(date);
  switch (dayName) {
    case "Monday":
      return "الإثنين";
    case "Tuesday":
      return "الثلاثاء";
    case "Wednesday":
      return "الأربعاء";
    case "Thursday":
      return "الخميس";
    case "Friday":
      return "الجمعة";
    case "Saturday":
      return "السبت";
    default:
      return "الاحد";
  }
}
