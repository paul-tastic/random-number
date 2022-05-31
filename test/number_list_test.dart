import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_numbers/models/number_list.dart';

void main() {
  test('number list should return a list of requested length', () {
    const upperLimit = 10000;

    final List<int> list = NumberList.buildNumberList(limit: upperLimit);

    expect(list.length, 10000);
  });

  test('2 requested lists are equal', () {
    const upperLimit = 10000;
    final List<int> list1 = NumberList.buildNumberList(limit: upperLimit);
    final List<int> list2 = NumberList.buildNumberList(limit: upperLimit);

    expect(listEquals(list1, list2), true);
  });

  test('shuffled list is randomized and different than original list', () {
    const upperLimit = 10000;
    final List<int> list1 = NumberList.buildNumberList(limit: upperLimit);
    final List<int> list2 = NumberList.buildNumberList(limit: upperLimit);

    list2.shuffle();
    expect(listEquals(list1, list2), false);
  });
}
