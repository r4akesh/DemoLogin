 

import 'package:bloc_login/to_do/bloc/todo_event.dart';
import 'package:bloc_login/to_do/bloc/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<ToDoEvent, ToDoState> {
  TodoBloc() : super(TodoInitialState()) {
    on<AddToDo>((event, emit) {
        final updateTask = List<String>.from((state as TodoInitialState).toDoItem)..add(event.task);
        emit(TodoInitialState(toDoItem: updateTask));
    });

    on<RemoveToDo>((event,emit){
      final updateTask = List<String>.from((state as TodoInitialState).toDoItem)..remove(event.task);
      emit(TodoInitialState(toDoItem: updateTask));
    });
  }
}
