import 'package:todo_cubit/cubits/cubits.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
class TodoHeader extends StatelessWidget {
  const TodoHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("TODO", style: TextStyle(fontSize: 40),),
        BlocBuilder<ActiveTodoCountCubit, ActiveTodoCountState>(
          builder: (context, state) {
            return Text(
              "${state.activeTodoCount} items Left",
              style: TextStyle(fontSize: 20, color: Colors.redAccent),
            );
          },
        ),
        // Text('${context.watch<ActiveTodoCountCubit>().state.activeTodoCount} items left',
        //   style: TextStyle(fontSize: 20,color: Colors.redAccent),
        // )
      ],
    );
  }
}
