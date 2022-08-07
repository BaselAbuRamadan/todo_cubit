import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_cubit/cubits/todo_list/todo_list_cubit.dart';

import '../../models/todos_model.dart';
part 'active_todo_count_state.dart';

class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  final TodoListCubit todoListCubit;
  final int initialActiveTodoCountt;
late final StreamSubscription todoListSubscribiton;
  ActiveTodoCountCubit({
    required this.initialActiveTodoCountt,
    required this.todoListCubit,
  }) : super(ActiveTodoCountState(activeTodoCount: initialActiveTodoCountt)) {
    todoListSubscribiton = todoListCubit.stream.listen((TodoListState todoListState){
      print ("todo list state : $todoListState");
      final int currentActiveTodoCount =
          todoListState.todos.where((Todo todo) => !todo.completed)
          .toList().length;
      emit(state.copyWith(activeTodoCount: currentActiveTodoCount));


    } );
  }

  @override
  Future<void> close(){
    todoListSubscribiton.cancel();
    return super.close();

  }
}
