import 'package:equatable/equatable.dart';
import 'package:plant_store/presentation/home/models/product_model.dart';

abstract class CartBlocEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnAddProductToCart extends CartBlocEvents {
  final int quantity;
  final ProductModel product;

  OnAddProductToCart({required this.product, required this.quantity});
}

class OnMinusProductFromCart extends CartBlocEvents {
  final int quantity;
  final ProductModel product;

  OnMinusProductFromCart({required this.product, required this.quantity});
}

class OnRemoveProductFromCart extends CartBlocEvents {
  final ProductModel product;

  OnRemoveProductFromCart({required this.product});
}
