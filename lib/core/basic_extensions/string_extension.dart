extension StringExt on String {
  bool toBoolean() {
    if (toLowerCase() == 'true') {
      return true;
    } else if (toLowerCase() == 'false') {
      return false;
    }
    throw '"$this" can not be parsed to boolean';
  }
}

extension NullableStringExt on String? {
  String toFourDigitFormatted() {
    if (this == null) {
      return '';
    } else {
      return toString()
          .replaceAllMapped(RegExp(r'.{4}'), (match) => '${match.group(0)} ');
    }
  }
}
