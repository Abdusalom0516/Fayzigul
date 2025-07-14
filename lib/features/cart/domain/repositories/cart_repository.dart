import 'package:plant_store/features/cart/data/models/cart_product_model.dart';

abstract class CartRepository {
  // Method to save cart list
  Future<void> saveCartList(List<CartProductModel> cartList);

  // Method to get cart list
  Future<List<CartProductModel>> getCartList();
}
