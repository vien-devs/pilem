extension RangeExt on int {
  bool inRange(int first, int last) {
    return first <= this && this <= last;
  }
}