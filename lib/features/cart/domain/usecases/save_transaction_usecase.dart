import 'package:plant_store/features/cart/data/models/transactions_model.dart';
import 'package:plant_store/features/cart/domain/repositories/transactions_repository.dart';

class SaveTransactionUsecase {
  final TransactionsRepository repository;

  SaveTransactionUsecase({required this.repository});

  Future<void> call({required TransactionsModel transaction}) async {
    await repository.saveTransaction(transaction: transaction);
  }
}
