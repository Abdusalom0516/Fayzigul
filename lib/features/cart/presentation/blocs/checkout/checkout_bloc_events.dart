import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:plant_store/features/cart/data/models/cart_product_model.dart';
import 'package:plant_store/features/cart/data/models/transactions_model.dart';

class CheckoutBlocEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnCheckoutClicked extends CheckoutBlocEvents {
  final BuildContext context;
  final TransactionsModel transactionsModel;
  final List<CartProductModel> listOfCheckoutProducts;

  OnCheckoutClicked({required this.context, required this.transactionsModel, required this.listOfCheckoutProducts});
}

class OnGetTransactionsClicked extends CheckoutBlocEvents {}
