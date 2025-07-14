import 'package:plant_store/features/cart/data/datasources/cart_local_data_source.dart';
import 'package:plant_store/features/cart/data/models/cart_product_model.dart';
import 'package:plant_store/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImplementation extends CartRepository {
  CartLocalDataSource localDataSource;

  CartRepositoryImplementation({required this.localDataSource});

  @override
  Future<List<CartProductModel>> getCartList() async {
    return await localDataSource.getCartList();
  }

  @override
  Future<void> saveCartList(List<CartProductModel> cartList) async {
    await localDataSource.saveCartList(cartList: cartList);
  }
}
