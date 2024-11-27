class CustomDateTime {
  static String getFormattedDate(DateTime dateTime) {
    return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
  }

  static String getFormattedTime(DateTime dateTime) {
    return "${dateTime.hour}:${dateTime.minute}";
  }
}