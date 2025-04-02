import 'package:bloc_login/shopping/model/ProductModel.dart';



class ProductRepository {
  List<ProductModel> getProducts() {
    return [
      ProductModel(
        id: '1',
        name: 'Product 1',
        description: 'Description for Product 1',
        price: 50.123,
        imageUrl: 'https://via.placeholder.com/150',
      ),
      ProductModel(
        id: '2',
        name: 'Product 2',
        description: 'Description for Product 2',
        price: 75.0,
        imageUrl: 'https://via.placeholder.com/150',
      ),
      // Add more products
    ];
  }
}