import 'package:plant_store/features/cart/data/models/transactions_model.dart';

class CheckoutBlocStates {
  final List<TransactionsModel> transactionsList;
  final bool isLoading;

  CheckoutBlocStates({required this.transactionsList, required this.isLoading});

  CheckoutBlocStates copyWith(
      {List<TransactionsModel>? transactionsList, bool? isLoading}) {
    return CheckoutBlocStates(
        transactionsList: transactionsList ?? this.transactionsList,
        isLoading: isLoading ?? this.isLoading);
  }
}
