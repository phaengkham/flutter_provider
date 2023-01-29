import 'package:app_provider/models/transacton_models.dart';
import 'package:flutter/foundation.dart';

class transactionProvider with ChangeNotifier {
  List<transactionModels> Transactions = [];
  List<transactionModels> getTransaction() {
    return Transactions;
  }

  void addTransaction(transactionModels statment) {
    Transactions.insert(0, statment);
    notifyListeners();
  }
}
