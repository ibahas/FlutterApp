class AgeCalculator {
  static var msg = '';
  static int age = 0;

  AgeCalculator(int p) {
    if (p <= DateTime.now().year && p >= 1) {
      age = DateTime.now().year - p;
      msg = 'Your age is $age';
    } else {
      msg = 'Check your age';
    }
  }
}
