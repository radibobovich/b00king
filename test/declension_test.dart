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

  test('Tourists number declension', () {
    expect(touristDeclension(1), 'Первый');
    expect(touristDeclension(10), 'Десятый');
    expect(touristDeclension(11), 'Одиннадцатый');
    expect(touristDeclension(22), 'Двадцать второй');
    expect(touristDeclension(30), 'Тридцатый');
    expect(touristDeclension(95), 'Девяносто пятый');
    expect(touristDeclension(100), '100');
  });
}
