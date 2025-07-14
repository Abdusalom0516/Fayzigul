import 'package:hive/hive.dart';
import 'package:plant_store/features/cart/data/models/cart_product_model.dart';

class CartLocalDataSource {
  Future<List<CartProductModel>> getCartList() async {
    final box = Hive.box("cart");

    return box.values.map((e) => CartProductModel.fromJson(e)).toList();
  }

  Future<void> saveCartList({required List<CartProductModel> cartList}) async {
    final box = Hive.box("cart");

    await box.clear();
    await box.addAll(cartList.map((e) => e.toJson()));
  }
}
