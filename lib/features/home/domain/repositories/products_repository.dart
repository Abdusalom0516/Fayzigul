import 'package:plant_store/features/home/data/models/product_model.dart';

abstract class ProductsRepository {

  // Method to get products
  Future<List<ProductModel>> getProducts();
}
