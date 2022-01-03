import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider((ref) => 0);

class Counter extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _counter = ref.watch(counterProvider.state).state;
    return Scaffold(
        appBar: AppBar(
          title: const Text('counter app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(_counter.toString())],
          ),
        ),
        floatingActionButton: CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 30,
          child: IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              ref.read(counterProvider.state).state++;
            },
          ),
        ));
  }
}
