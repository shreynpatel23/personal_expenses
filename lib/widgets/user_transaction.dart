import 'package:flutter/material.dart';
import '../services/transaction.dart';
import './transaction_list.dart';
import './new_transacrtion.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _transactions = [
    Transaction(
        id: 'id1', title: 'New Shoes', amount: 30.43, date: DateTime.now()),
    Transaction(
        id: 'id2', title: 'Cricket Bat', amount: 14.22, date: DateTime.now()),
  ];

  void addNewTransaction(String title, double amount) {
    final newTx = Transaction(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      _transactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // add new transaction card will come here.
        NewTransaction(onAddNewTransaction: addNewTransaction),
        // list of transactions will come here
        TransactionList(
          userTransaction: _transactions,
        ),
      ],
    );
  }
}
