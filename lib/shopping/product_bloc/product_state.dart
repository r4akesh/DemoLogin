import 'package:bloc_login/shopping/model/ProductModel.dart';
import 'package:equatable/equatable.dart';


abstract class ProductState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductModel> products;

  ProductLoaded(this.products);

  @override
  List<Object> get props => [products];
}