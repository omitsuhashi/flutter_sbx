import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final helloWorldProvider = Provider<String>((ref) => 'Hello World');

class CountModel {
  final int count;

  CountModel({this.count = 0});

  CountModel copyWith(int count) {
    return CountModel(count: count);
  }
}

class CounterState extends StateNotifier<CountModel> {
  CounterState(CountModel state) : super(state);

  countUp() {
    state = state.copyWith(state.count + 1);
  }
}

final counterProvider = StateNotifierProvider<CounterState, CountModel>(
    (ref) => CounterState(CountModel()));

class ProviderApp extends ConsumerWidget {
  const ProviderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String hello = ref.watch(helloWorldProvider);
    final counter = ref.watch(counterProvider.select((value) => value.count));

    return Scaffold(
        appBar: AppBar(
          title: const Text('Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(hello),
              Text(counter.toString()),
              ElevatedButton(
                  onPressed: ref.read(counterProvider.notifier).countUp,
                  child: const Text('count up'))
            ],
          ),
        ));
  }
}
