part of 'active_todo_count_cubit.dart';

class ActiveTodoCountState extends Equatable {
  final int activeTodoCount;

  @override
  List<Object> get props => [activeTodoCount];


  factory ActiveTodoCountState.initial(){
    return ActiveTodoCountState(activeTodoCount: 0);
  }

  @override
  String toString() {
    return 'ActiveTodoCountState{activeTodoCount: $activeTodoCount}';
  }

  ActiveTodoCountState copyWith({
    int? activeTodoCount,
  }) {
    return ActiveTodoCountState(
      activeTodoCount: activeTodoCount ?? this.activeTodoCount,
    );
  }

  const ActiveTodoCountState({
    required this.activeTodoCount,
  });
}
