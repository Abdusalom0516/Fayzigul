import 'package:equatable/equatable.dart';
import 'package:plant_store/features/cart/data/models/transactions_model.dart';

class CheckoutBlocEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnCheckoutClicked extends CheckoutBlocEvents {
  final TransactionsModel transactionsModel;

  OnCheckoutClicked({required this.transactionsModel});
}

class OnGetTransactionsClicked extends CheckoutBlocEvents{}
