import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/services/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransaction;
  TransactionList({this.userTransaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return (Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red[400], width: 1),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    userTransaction[index].amount.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[400]),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      userTransaction[index].title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      DateFormat.yMMMd().format(userTransaction[index].date),
                      style: TextStyle(fontSize: 14, color: Colors.grey[400]),
                    ),
                  ],
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    child: IconButton(
                      onPressed: () {
                        print('delete clicked');
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 25,
                      ),
                    ))
              ],
            ),
          ));
        },
        itemCount: userTransaction.length,
        //     child: Column(
        //     children: userTransaction.map((tx) {
        //   return ();
        // }).toList()),
      ),
    );
  }
}
