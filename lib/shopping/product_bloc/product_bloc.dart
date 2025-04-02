import 'package:bloc_login/shopping/repo/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_event.dart';
import 'product_state.dart';


class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc(this.productRepository) : super(ProductLoading()) {
    on<LoadProducts>((event, emit) {
      final products = productRepository.getProducts();
      emit(ProductLoaded(products));
    });
  }
}