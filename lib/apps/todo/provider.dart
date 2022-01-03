import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'model.dart';

class TodoList extends StateNotifier<List<TodoModel>> {
  TodoList(List<TodoModel> state) : super(state);

  void add(String title) {
    final data = TodoModel(title, '', false);
    // こっちだと画面更新ができない
    // state.add(data);
    state = [...state, data];
  }

  // この辺も上と同様に描写のための対応
  void toggleDone(String id) {
    state = List.generate(state.length, (idx) {
      final data = state[idx];
      if (data.id == id) {
        return TodoModel(data.name, data.description, true);
      } else {
        return data;
      }
    });
  }

  void delete(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}

final todoListProvider =
    StateNotifierProvider<TodoList, List<TodoModel>>((ref) => TodoList([]));
