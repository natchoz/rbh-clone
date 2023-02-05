class RbhUtils {
  static RegExp regex = RegExp(r'([.]*0)(?!.*\d)');

  static String convertDisplayPrice(double price) {
    return price.toString().replaceAll(regex, '');
  }
}
