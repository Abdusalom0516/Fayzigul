import 'package:plant_store/features/cart/data/datasources/transactions_remote_datasource.dart';
import 'package:plant_store/features/cart/data/models/transactions_model.dart';
import 'package:plant_store/features/cart/domain/repositories/transactions_repository.dart';

class TransactionsRepositoryImplementation extends TransactionsRepository {
  final TransactionsRemoteDatasource remoteDatasource;

  TransactionsRepositoryImplementation({required this.remoteDatasource});

  @override
  Future<List<TransactionsModel>> getTransactions() async {
    return await remoteDatasource.getTransactions();
  }

  @override
  Future<void> saveTransaction({required TransactionsModel transaction}) async {
    await remoteDatasource.saveTransaction(transaction: transaction);
  }
}
