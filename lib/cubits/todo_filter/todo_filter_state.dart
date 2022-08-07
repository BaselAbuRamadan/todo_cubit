part of 'todo_filter_cubit.dart';

class TodoFilterState {
  final Filter filter;

  @override
  List<Object> get props => [filter];
factory TodoFilterState.initial(){
  return TodoFilterState(filter: Filter.all);
}
  @override
  String toString() {
    return 'TodoFilterState{filter: $filter}';
  }

  const TodoFilterState({
    required this.filter,
  });

  TodoFilterState copyWith({
    Filter? filter,
  }) {
    return TodoFilterState(
      filter: filter ?? this.filter,
    );
  }
}

