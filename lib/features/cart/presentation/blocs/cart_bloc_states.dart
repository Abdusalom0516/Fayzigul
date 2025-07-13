import 'package:plant_store/features/cart/data/models/cart_product_model.dart';

class CartBlocStates {
  final List<CartProductModel> cartProductsList;

  CartBlocStates({required this.cartProductsList});
}
