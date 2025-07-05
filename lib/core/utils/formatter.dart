String formatNumber(double value) {
  if (value == value.toInt()) {
    return value.toInt().toString();
  } else {
    return value.toStringAsFixed(2);
  }
}
