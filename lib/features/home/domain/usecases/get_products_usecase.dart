import 'package:plant_store/features/home/data/models/product_model.dart';
import 'package:plant_store/features/home/domain/repositories/products_repository.dart';

class GetProductsUsecase {
  final ProductsRepository repository;

  GetProductsUsecase({required this.repository});

  Future<List<ProductModel>> call() async {
    return await repository.getProducts();
  }
}
