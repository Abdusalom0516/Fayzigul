import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plant_store/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:plant_store/features/auth/data/models/user_model.dart';
import 'package:plant_store/features/auth/data/repositories/auth_repository_implementation.dart';
import 'package:plant_store/features/auth/domain/usecases/get_user_data_usecase.dart';
import 'package:plant_store/features/cart/data/models/transactions_model.dart';

class TransactionsRemoteDatasource {
  // Method to save Transactions
  Future<void> saveTransaction({required TransactionsModel transaction}) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    AuthRepositoryImplementation repository =
        AuthRepositoryImplementation(localDataSource: AuthLocalDataSource());

    final getUserUsecase = GetUserDataUsecase(repository: repository);

    UserModel user = await getUserUsecase();

    await firestore
        .collection("transactions")
        .doc(user.uid)
        .collection("transactions")
        .add(transaction.toJson());
  }

  // Method to get Transactions
  Future<List<TransactionsModel>> getTransactions() async {
    List<TransactionsModel> transactionsList = [];
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    AuthRepositoryImplementation repository =
        AuthRepositoryImplementation(localDataSource: AuthLocalDataSource());

    final getUserUsecase = GetUserDataUsecase(repository: repository);

    UserModel user = await getUserUsecase();

    final response = await firestore
        .collection("transactions")
        .doc(user.uid)
        .collection("transactions")
        .get();

    for (var elem in response.docs) {
      transactionsList.add(TransactionsModel.fromJson(elem.data()));
    }

    transactionsList.sort((a, b) => b.date.compareTo(a.date));

    return transactionsList;
  }
}
