import 'package:plant_store/features/cart/data/models/transactions_model.dart';

class CheckoutBlocStates {
  final List<TransactionsModel> transactionsList;

  CheckoutBlocStates({required this.transactionsList});

  CheckoutBlocStates copyWith(List<TransactionsModel>? transactionsList) {
    return CheckoutBlocStates(
        transactionsList: transactionsList ?? this.transactionsList);
  }
}
