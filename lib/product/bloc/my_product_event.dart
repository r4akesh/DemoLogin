


 import 'package:equatable/equatable.dart';

abstract  class MyProductEvent extends Equatable {
   @override
   List<Object> get props => [];
}

class LoadMyProducts extends MyProductEvent{}


class DeleteMyProduct extends MyProductEvent{
   int productID;
   DeleteMyProduct(this.productID);

  @override
  List<Object> get props => [];
}
