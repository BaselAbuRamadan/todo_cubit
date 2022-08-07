import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/cubits/cubits.dart';
import 'package:todo_cubit/pages/todos_page/todo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoFilterCubit>(create: (context)=>TodoFilterCubit(),),
        BlocProvider<TodoSearchCubit>(create: (context)=>TodoSearchCubit(),),
        BlocProvider<TodoListCubit>(create: (context)=>TodoListCubit(),),
        BlocProvider<ActiveTodoCountCubit>(create: (context)=>ActiveTodoCountCubit(
          initialActiveTodoCountt: context.read<TodoListCubit>().state.todos
            .length,
            todoListCubit: BlocProvider.of<TodoListCubit>(context)
        ),),
        BlocProvider<FilterdTodosCubit>(
            create: (context) => FilterdTodosCubit(
              initialTodos:context.read<TodoListCubit>().state.todos,
            todoFilterCubit: BlocProvider.of<TodoFilterCubit>(context),
            todoSearchCubit: BlocProvider.of<TodoSearchCubit>(context),
            todoListCubit: BlocProvider.of<TodoListCubit>(context)))


      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TodosPage(),
      ),
    );
  }
}


