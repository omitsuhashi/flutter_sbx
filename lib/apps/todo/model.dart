import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class TodoModel {
  TodoModel(this.name, this.description, this.isCompleted) : id = _uuid.v4();

  late String id;
  String name;
  String description;
  bool isCompleted;
}
