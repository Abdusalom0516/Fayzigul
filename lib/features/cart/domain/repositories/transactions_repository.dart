import 'package:plant_store/features/cart/data/models/transactions_model.dart';

abstract class TransactionsRepository {

  // Method to save Transactions
  Future<void> saveTransaction({required TransactionsModel transaction});

  // Method to get Transactions
  Future<List<TransactionsModel>> getTransactions();
}
