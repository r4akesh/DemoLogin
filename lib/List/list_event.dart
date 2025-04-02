

import 'package:equatable/equatable.dart';

class ListEvent extends Equatable{
  @override
  List<Object?> get props => [];


}

class FetchItem extends ListEvent{
  @override
  List<Object?> get props => [];
}

class DeleteItem extends ListEvent{
  final int id;
  DeleteItem(this.id);


  @override
  // TODO: implement props
  List<Object?> get props => [];
}
