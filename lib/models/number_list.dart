import 'package:equatable/equatable.dart';

class NumberList extends Equatable {
  const NumberList(this.numberList);
  final List<int> numberList;

  static buildNumberList({required int limit}) {
    var list = List<int>.generate(limit, (i) => i + 1);
    return list;
  }

  @override
  List<Object?> get props => [numberList];
}
