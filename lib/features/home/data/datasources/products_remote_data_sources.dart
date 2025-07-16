import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plant_store/features/cart/data/models/cart_product_model.dart';
import 'package:plant_store/features/home/data/models/product_model.dart';

class ProductsRemoteDataSources {
  Future<List<ProductModel>> getProducts() async {
    List<ProductModel> productsList = [];
    final instance = FirebaseFirestore.instance;

    final equipmentsData = await instance.collection("equipments").get();

    final plantsData = await instance.collection("products").get();

    for (var elem in equipmentsData.docs) {
      productsList.add(ProductModel.fromJson(elem.data()));
    }

    for (var elem in plantsData.docs) {
      productsList.add(ProductModel.fromJson(elem.data()));
    }

    return productsList;
  }

  Future<void> updateQuantityOfProduct(
      List<CartProductModel> productsList) async {
    final instance = FirebaseFirestore.instance;
    var remoteProducts = await instance.collection("products").get();

    for (var elem in productsList) {
      for (var doc in remoteProducts.docs) {
        final product = ProductModel.fromJson(doc.data());

        if (elem.product == product) {
          doc.reference.update(elem.product
              .copyWith(quantity: elem.product.quantity - elem.productQuantity)
              .toJson() as Map<Object, Object?>);
        }
      }
    }
  }
}
