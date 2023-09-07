extension CompareDates on DateTime {
  bool isSameDateAs(DateTime other) {
    return day == other.day &&
        month == other.month &&
        year == other.year;
  }
}
