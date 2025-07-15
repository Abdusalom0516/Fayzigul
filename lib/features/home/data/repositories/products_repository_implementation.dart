import 'package:plant_store/features/home/data/datasources/products_remote_data_sources.dart';
import 'package:plant_store/features/home/data/models/product_model.dart';
import 'package:plant_store/features/home/domain/repositories/products_repository.dart';

class ProductsRepositoryImplementation extends ProductsRepository {
  ProductsRemoteDataSources remoteDataSources;

  ProductsRepositoryImplementation({required this.remoteDataSources});

  @override
  Future<List<ProductModel>> getProducts() async {
    return await remoteDataSources.getProducts();
  }
}
