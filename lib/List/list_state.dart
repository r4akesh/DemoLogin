import 'package:equatable/equatable.dart';

import 'ItemModel.dart';

class ListState extends Equatable {

  @override
  List<Object?> get props => [];
}

class ItemIntial extends ListState {

  @override
  List<Object?> get props => [];
}

class ItemLoading extends ListState {
 @override
 List<Object?> get props => [];
}

class ItemLoaded extends ListState {
  final List<ItemModel> items;
  ItemLoaded(this.items);
  @override
  List<Object?> get props => [];


}

class ItemError extends ListState {
  final String message;
  ItemError(this.message);

  // @override
  // List<Object?> get props => [];

}


