import 'package:plant_store/features/home/data/models/product_model.dart';

class ProductsBlocStates {
  final bool isLoading;
  final List<ProductModel> productsList;
  final String? errorMessage;

  ProductsBlocStates(
      {required this.productsList, required this.isLoading, this.errorMessage});

  ProductsBlocStates copyWith(
      {bool? isLoading,
      List<ProductModel>? productsList,
      String? errorMessage}) {
    return ProductsBlocStates(
        productsList: productsList ?? this.productsList,
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage);
  }
}
