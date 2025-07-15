import 'package:cloud_firestore/cloud_firestore.dart';
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
}
