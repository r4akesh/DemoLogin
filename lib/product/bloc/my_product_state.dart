


import 'package:equatable/equatable.dart';

import '../MyProductModel.dart';

abstract  class MyProductState extends Equatable {
  const MyProductState();//???
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductLoading extends MyProductState{

}
class ProductLoaded  extends MyProductState{

  final List<Myproductmodel> listItem;

  ProductLoaded(this.listItem);
}

class ProductError extends MyProductState {}