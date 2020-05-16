import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/services/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransaction;
  TransactionList({this.userTransaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      height: 470,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: (Card(
              margin: EdgeInsets.all(7),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      // use this ToStringAsFixed property of string to round off the decimal to 2 values.
                      "\$ ${userTransaction[index].amount.toStringAsFixed(2)}",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          userTransaction[index].title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          DateFormat.yMMMd()
                              .format(userTransaction[index].date),
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[400]),
                        ),
                      ],
                    ),
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
            )),
          );
        },
        itemCount: userTransaction.length,
      ),
    );
  }
}
