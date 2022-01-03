import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sbx/apps/todo/provider.dart';

class TodoWidget extends ConsumerWidget {
  const TodoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoListProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('TODO'),
        ),
        body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (ctx, idx) {
            return Text(todoList[idx].name);
          },
        ),
        floatingActionButton: CircleAvatar(
          radius: 20,
          child: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              ref.read(todoListProvider.notifier).add('test2');
            },
          ),
        ));
  }
}
