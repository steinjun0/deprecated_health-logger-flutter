getNumberRemovedZeroTrailing(number) {
  RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
  String s = number.toString().replaceAll(regex, '');
  return s;
}