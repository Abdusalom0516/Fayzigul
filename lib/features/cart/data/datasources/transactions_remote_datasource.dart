import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plant_store/features/cart/data/models/transactions_model.dart';

class TransactionsRemoteDatasource {
  // Method to save Transactions
  Future<void> saveTransaction({required TransactionsModel transaction}) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    await firestore
        .collection("transactions")
        .doc("abdusalom")
        .collection("transactions")
        .add(transaction.toJson());
  }

  // Method to get Transactions
  Future<List<TransactionsModel>> getTransactions() async {
    List<TransactionsModel> transactionsList = [];
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    final response = await firestore
        .collection("transactions")
        .doc("abdusalom")
        .collection("transactions")
        .get();

    for (var elem in response.docs) {
      transactionsList.add(TransactionsModel.fromJson(elem.data()));
    }

    transactionsList.sort((a, b) => b.date.compareTo(a.date));

    return transactionsList;
  }
}
