import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_cubit/cubits/todo_filter/todo_filter_cubit.dart';
import 'package:todo_cubit/cubits/todo_list/todo_list_cubit.dart';
import 'package:todo_cubit/cubits/todo_search/todo_search_cubit.dart';
// import 'package:todo_cubit/cubits/todo_search/todo_search_state.dart';

import '../../models/todos_model.dart';

part 'filterd_todos_state.dart';

class FilterdTodosCubit extends Cubit<FilterdTodosState> {
   late StreamSubscription todoFilterSubscribtion;
   late StreamSubscription todoSearchSubscribtion;
   late StreamSubscription todoListSubscribtion;

  final List<Todo> initialTodos;
  final TodoFilterCubit todoFilterCubit;
  final TodoSearchCubit todoSearchCubit;
  final TodoListCubit todoListCubit;


  FilterdTodosCubit({
    required this.initialTodos,
    required this.todoFilterCubit,
    required this.todoSearchCubit,
    required this.todoListCubit,
  }) : super(FilterdTodosState(filterdTodos: initialTodos)){
    todoFilterSubscribtion =
    todoFilterCubit.stream.listen((TodoFilterState todoFilterState) {
  setFilterdTodos();
    });
    todoFilterSubscribtion =
        todoSearchCubit.stream.listen((TodoSearchState todoSearchState) {
  setFilterdTodos();
        });
    todoFilterSubscribtion =
        todoListCubit.stream.listen((TodoListState todoListState) {
  setFilterdTodos();
        });
  }

  void setFilterdTodos(){
    List <Todo> _filterdTodos;
    switch (todoFilterCubit.state.filter){
      case Filter.active:
        _filterdTodos = todoListCubit
          .state.todos.where((Todo todo) => !todo.completed).toList();
        break;

      case Filter.completed:
        _filterdTodos = todoListCubit
            .state.todos.where((Todo todo) => todo.completed).toList();
        break;
      case Filter.all:
      default : _filterdTodos = todoListCubit.state.todos;
      break;
    }
    if(todoSearchCubit.state.searchTerm.isNotEmpty){
      _filterdTodos = _filterdTodos.where((Todo todo) => todo.desc
      .toLowerCase()
      .contains(todoSearchCubit.state.searchTerm)).toList();
    }
    emit(state.copyWith(filterdTodos: _filterdTodos));

    Future <void> close (){
      todoFilterSubscribtion.cancel();
      todoListSubscribtion.cancel();
      todoSearchSubscribtion.cancel();
      return super.close();
    }
  }
}
