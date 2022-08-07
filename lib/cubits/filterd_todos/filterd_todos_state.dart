part of 'filterd_todos_cubit.dart';

class FilterdTodosState extends Equatable {
  final List <Todo> filterdTodos;

  @override
  String toString() {
    return 'FilterdTodosState{filterdTodos: $filterdTodos}';
  }
factory FilterdTodosState.initial(){
    return FilterdTodosState(filterdTodos: []);
}
  @override
  List<Object> get props => [filterdTodos];



  FilterdTodosState copyWith({
    List<Todo>? filterdTodos,
  }) {
    return FilterdTodosState(
      filterdTodos: filterdTodos ?? this.filterdTodos,
    );
  }

  const FilterdTodosState({
    required this.filterdTodos,
  });
}

