extension StringExtensions on String {
  String intelliTrim() {
    return length <= 15 ? this : '${substring(0, 15)}...';
  }
}
