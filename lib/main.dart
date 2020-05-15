import 'package:flutter/material.dart';
import './widgets/new_transacrtion.dart';
import './widgets/transaction_list.dart';
import './services/transaction.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.green, accentColor: Colors.orange),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [
    Transaction(
        id: 'id1', title: 'New Shoes', amount: 30.43, date: DateTime.now()),
    Transaction(
        id: 'id2', title: 'Cricket Bat', amount: 14.22, date: DateTime.now()),
  ];

  // use this method for adding a new transaction.
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

  // use this method to toggle the modal for add new transaction
  void showAddNewTransactionModal(BuildContext context) {
    // as context builder also accepts a context as parameter
    // as we do not use the builder parameters so we are using _
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(onAddNewTransaction: addNewTransaction),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Personal Expenses'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => showAddNewTransactionModal(context),
            padding: EdgeInsets.all(10),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Card(
                  margin: EdgeInsets.all(15),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Graph will come here',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  elevation: 5,
                  color: Theme.of(context).primaryColor,
                ),
                // list of transactions will come here
                TransactionList(
                  userTransaction: _transactions,
                ),
              ],
            )),
      ),
      // use the floatingActionButtonLocation for aligning the floating button.
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddNewTransactionModal(context),
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).accentColor,
      ),
    );
  }
}
