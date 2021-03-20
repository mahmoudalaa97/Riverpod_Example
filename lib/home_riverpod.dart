import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterStateNotifier extends StateNotifier<Counter> {
  CounterStateNotifier([Counter? counter])
      : super(counter ?? Counter(0, text: "test"));

  void increment() {
    state = Counter(state.count + 1, text: "test ${state.count}");
  }
}

class Counter {
  final int count;
  final String? text;

  Counter(this.count, {this.text});
}


