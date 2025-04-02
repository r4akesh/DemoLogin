import 'package:bloc_login/shopping/model/ProductModel.dart';
import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddToCart extends CartEvent {
  final ProductModel product;

  AddToCart(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveFromCart extends CartEvent {
  final ProductModel product;

  RemoveFromCart(this.product);

  @override
  List<Object> get props => [product];
}