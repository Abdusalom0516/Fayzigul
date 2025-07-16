import 'package:plant_store/features/cart/data/models/cart_product_model.dart';
import 'package:plant_store/features/home/data/models/product_model.dart';

abstract class ProductsRepository {

  // Method to get products
  Future<List<ProductModel>> getProducts();

  // Method to update quantity products
  Future<void> updateQuantityOfProduct(List<CartProductModel> productsList);
}
