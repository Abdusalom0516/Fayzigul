import 'package:plant_store/features/cart/data/models/transactions_model.dart';
import 'package:plant_store/features/cart/domain/repositories/transactions_repository.dart';

class GetTransactionsUsecase {
  final TransactionsRepository repository;

  GetTransactionsUsecase({required this.repository});

  Future<List<TransactionsModel>> call() async {
    return await repository.getTransactions();
  }
}
