import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plant_store/features/cart/data/models/cart_product_model.dart';
import 'package:plant_store/features/home/data/models/product_model.dart';

class ProductsRemoteDataSources {
  Future<List<ProductModel>> getProducts() async {
    List<ProductModel> productsList = [];
    final instance = FirebaseFirestore.instance;

    final products = await instance.collection("products").get();

    for (var elem in products.docs) {
      productsList.add(ProductModel.fromJson(elem.data()));
    }

    return productsList;
  }

  Future<void> updateQuantityOfProduct(
      List<CartProductModel> productsList) async {
    final instance = FirebaseFirestore.instance;
    var remoteProducts = await instance.collection("products").get();

    for (var elem in productsList) {
      final product = remoteProducts.docs
          .where((element) =>
              ProductModel.fromJson(element.data()) == elem.product)
          .first;

      product.reference.update(elem.product
          .copyWith(quantity: (elem.product.quantity - elem.productQuantity))
          .toJson() as Map<Object, Object?>);
    }
  }
}
