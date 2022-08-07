import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

enum Filter{
  all,
  active,
  completed
}

Uuid uuid = Uuid();

class Todo extends Equatable {
  @override
  List<Object> get props => [id, desc, completed];
  final String id;
  final String desc;
  final bool completed;

  @override
  String toString() {
    return 'Todo{id: $id, desc: $desc, completed: $completed}';
  }

   Todo({
    String? id,
    required this.desc,
    this.completed = false,
  }) : this.id = id ?? uuid.v4();
}