import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:plant_store/features/home/data/models/product_model.dart';

abstract class CartBlocEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnAddProductToCart extends CartBlocEvents {
  final ProductModel product;
  final BuildContext context;
  final int quantity;

  OnAddProductToCart(
      {required this.product, required this.quantity, required this.context});
}

class OnUpdateProductsQuantityToCart extends CartBlocEvents {
  final int quantity;
  final ProductModel product;
  final BuildContext context;

  OnUpdateProductsQuantityToCart(
      {required this.product, required this.quantity, required this.context});
}

class OnMinusProductFromCart extends CartBlocEvents {
  final int quantity;
  final ProductModel product;
  final BuildContext context;

  OnMinusProductFromCart(
      {required this.product, required this.quantity, required this.context});
}

class OnRemoveProductFromCart extends CartBlocEvents {
  final ProductModel product;
  final BuildContext context;

  OnRemoveProductFromCart({required this.product, required this.context});
}

class OnCleanCart extends CartBlocEvents {
  final BuildContext context;

  OnCleanCart({required this.context});
}

class OnGetCartListClicked extends CartBlocEvents {}
