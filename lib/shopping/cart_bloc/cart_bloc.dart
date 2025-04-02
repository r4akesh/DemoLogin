import 'package:bloc_login/shopping/cart_bloc/cart_event.dart';
import 'package:bloc_login/shopping/cart_bloc/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoaded([])) {
    on<AddToCart>((event, emit) {
      final state = this.state as CartLoaded;
      emit(CartLoaded(List.from(state.cartItems)..add(event.product)));
    });

    on<RemoveFromCart>((event, emit) {
      final state = this.state as CartLoaded;
      emit(CartLoaded(List.from(state.cartItems)..remove(event.product)));
    });
  }
}