import 'package:plant_store/features/cart/data/models/cart_product_model.dart';
import 'package:plant_store/features/cart/domain/repositories/cart_repository.dart';

class GetCartListUsecase {
  final CartRepository repository;

  GetCartListUsecase({required this.repository});

  Future<List<CartProductModel>> call() async {
    return await repository.getCartList();
  }
}
