import 'package:booking/utils/price_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Price formatter', () {
    expect(formatPrice(6), '6');
    expect(formatPrice(60), '60');
    expect(formatPrice(600), '600');
    expect(formatPrice(6600), '6 600');
    expect(formatPrice(86600), '86 600');
    expect(formatPrice(186600), '186 600');
    expect(formatPrice(1866000), '1 866 000');
    expect(formatPrice(18660000), '18 660 000');
    expect(formatPrice(186600000), '186 600 000');
  });
}
