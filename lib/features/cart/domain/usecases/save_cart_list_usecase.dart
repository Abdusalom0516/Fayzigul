import 'package:plant_store/features/cart/data/models/cart_product_model.dart';
import 'package:plant_store/features/cart/domain/repositories/cart_repository.dart';

class SaveCartListUsecase {
  final CartRepository repository;

  SaveCartListUsecase({required this.repository});

  Future<void> call({required List<CartProductModel> cartList}) async {
    return await repository.saveCartList(cartList);
  }
}
