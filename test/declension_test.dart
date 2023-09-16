import 'package:booking/utils/declension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Nights number declension', () {
    expect(nightsDeclension(21), 'ночь');
    expect(nightsDeclension(1), 'ночь');
    expect(nightsDeclension(2), 'ночи');
    expect(nightsDeclension(3), 'ночи');
    expect(nightsDeclension(4), 'ночи');
    expect(nightsDeclension(5), 'ночей');
    expect(nightsDeclension(16), 'ночей');
    expect(nightsDeclension(7), 'ночей');
    expect(nightsDeclension(8), 'ночей');
    expect(nightsDeclension(9), 'ночей');
    expect(nightsDeclension(10), 'ночей');
  });
}
