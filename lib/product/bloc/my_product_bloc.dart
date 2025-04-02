import 'package:bloc/bloc.dart';
import 'package:bloc_login/product/MyProductModel.dart';
import 'package:bloc_login/product/bloc/my_product_event.dart';
import 'package:bloc_login/product/bloc/my_product_state.dart';






class MyProductBloc extends Bloc<MyProductEvent, MyProductState> {
  MyProductBloc() : super(ProductLoading()) {
    // on<LoadProducts>((event, emit) {
    //   final products = List.generate(5, (index) => Product(id: index, name: "Product ${index + 1}"));
    //   emit(ProductLoaded(products));
    // });

    on<LoadMyProducts>((event, emit) {
      final products = List.generate(5, (index) => Myproductmodel(id: index, name: "Product ${index + 1}"));
      emit(ProductLoaded(products));
    });

    on<DeleteMyProduct>((event, emit) {
     if(state is ProductLoaded){
       final updateProduct = (state as  ProductLoaded).listItem
           .where((product) => product.id != event.productID)
           .toList();

       emit(ProductLoaded(updateProduct));
     }
     // final updateTask = List<String>.from((state as TodoInitialState).toDoItem)..remove(event.task);
     // emit(TodoInitialState(toDoItem: updateTask));
    });
  }
}
