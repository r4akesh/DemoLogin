import 'package:bloc_login/to_do/bloc/todo_bloc.dart';
import 'package:bloc_login/to_do/bloc/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/todo_event.dart';

class ToDoScreen extends StatelessWidget {
    ToDoScreen({super.key});
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo'),
      ),
      body: Column(children: [
      Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: 'Add a new task'),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              final title = _controller.text.trim();
              if (title.isNotEmpty) {
                context.read<TodoBloc>().add(AddToDo(title));
                _controller.clear();
              }
            },
          ),
        ],
      ),
      ),

        Expanded(
          child: BlocBuilder<TodoBloc, ToDoState>(
            builder: (context, state) {
              if (state is TodoInitialState) {
                final tasks = state.toDoItem;
                return ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    return ListTile(
                      title: Text(
                        task,
                        // style: TextStyle(
                        //   decoration: task.isCompleted
                        //       ? TextDecoration.lineThrough
                        //       : null,
                        // ),
                      ),
                      // leading: Checkbox(
                      //   value: task.isCompleted,
                      //   onChanged: (_) {
                      //     context
                      //         .read<TodoBloc>()
                      //         .add(ToggleTaskCompletion(task.id));
                      //   },
                      // ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          context.read<TodoBloc>().add(RemoveToDo(task));
                        },
                      ),
                    );
                  },
                );
              }
              return const Center(
                child: Text('No tasks available. Add some!'),
              );
            },
          ),
        ),



      ],)


    );
  }
}
