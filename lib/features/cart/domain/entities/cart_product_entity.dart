import 'package:equatable/equatable.dart';
import 'package:plant_store/features/home/models/product_model.dart';

class CartEntity extends Equatable {
  final ProductModel product;
  final int productQuantity;

  const CartEntity({required this.product, required this.productQuantity});

  @override
  List<Object?> get props => [product];
}
