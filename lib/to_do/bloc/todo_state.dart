


import 'package:equatable/equatable.dart';

class ToDoState extends Equatable{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class TodoInitialState extends ToDoState{
  final List<String> toDoItem;


 // TodoInitialState(this.toDoItem);
 TodoInitialState({this.toDoItem = const []});
  @override
    List<Object?> get props => [toDoItem];
}