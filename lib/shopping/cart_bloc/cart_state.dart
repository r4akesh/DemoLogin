import 'package:bloc_login/shopping/model/ProductModel.dart';
import 'package:equatable/equatable.dart';


abstract class CartState extends Equatable {
  @override
  List<Object> get props => [];
}

class CartLoaded extends CartState {
  final List<ProductModel> cartItems;

  CartLoaded(this.cartItems);

  @override
  List<Object> get props => [cartItems];
}