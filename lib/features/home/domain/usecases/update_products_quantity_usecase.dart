import 'package:plant_store/features/cart/data/models/cart_product_model.dart';
import 'package:plant_store/features/home/domain/repositories/products_repository.dart';

class UpdateProductsQuantityUsecase {
  final ProductsRepository repository;

  UpdateProductsQuantityUsecase({required this.repository});

  Future<void> call({required List<CartProductModel> productsList}) async {
    await repository.updateQuantityOfProduct(productsList);
  }
}
