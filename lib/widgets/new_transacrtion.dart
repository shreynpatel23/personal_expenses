import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // use this text editing comtroller to capture the input value in the variable
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function onAddNewTransaction;

  NewTransaction({this.onAddNewTransaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              // controller property is used for mapping the values in the TextEditController
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // controller property is used for mapping the values in the TextEditController
              controller: amountController,
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              padding: EdgeInsets.all(10),
              child: Text(
                'Add',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              color: Colors.red[400],
              textColor: Colors.white,
              onPressed: () {
                onAddNewTransaction(
                    titleController.text, double.parse(amountController.text));
              },
            )
          ],
        ),
      ),
    );
  }
}
