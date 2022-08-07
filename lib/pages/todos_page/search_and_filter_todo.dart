import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/cubits/cubits.dart';
import 'package:todo_cubit/utils/debounce.dart';

import '../../models/todos_model.dart';

class SearchAndFilterTodo extends StatelessWidget {
   SearchAndFilterTodo({Key? key}) : super(key: key);
  final debounce = Debounce(milliseconds: 600);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: " Search todos ....",
            border: InputBorder.none,
            filled: true,
            prefixIcon: Icon(Icons.search),

          ),
          onChanged: (String? newSearchItem){
            if(newSearchItem != null){
              debounce.run(() {
                context.read<TodoSearchCubit>().setSearchTerm(newSearchItem);
              });
            }
          },
        ),
        SizedBox(height: 10.0,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          filterButton(context,Filter.all),
          filterButton(context,Filter.active),
          filterButton(context,Filter.completed),

        ],)
      ],
    );
  }
  Widget filterButton(BuildContext context, Filter filter){
    return TextButton(
      onPressed: (){
        context.read<TodoFilterCubit>().changeFilter(filter);
      },
      child: Text(
        filter == Filter. all? 'All' : filter == Filter.active ? 'active'
            : 'completed',
        style: TextStyle(fontSize: 18,
            color: textColor(context, filter)),
      ),
    );
  }

  Color textColor (BuildContext context, Filter filter){
    final currentFilter = context.watch<TodoFilterCubit>().state.filter;
    return currentFilter == filter ? Colors.blue : Colors.grey;
  }
}
