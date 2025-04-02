import 'package:equatable/equatable.dart';

abstract class ToDoEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddToDo extends ToDoEvent {
  final String task;

  AddToDo(this.task);

  @override
  // TODO: implement props
  List<Object?> get props => [task];
}

class RemoveToDo extends ToDoEvent {
  final String task;

  RemoveToDo(this.task);

  @override
  // TODO: implement props
  List<Object?> get props => [task];
}
