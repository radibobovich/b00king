nightsDeclension(int nights) {
  if (nights % 10 == 1) {
    return 'ночь';
  } else if ([2, 3, 4].contains(nights % 10)) {
    return 'ночи';
  } else {
    return 'ночей';
  }
}
