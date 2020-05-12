import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // use this text editing comtroller to capture the input value in the variable
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function onAddNewTransaction;

  NewTransaction({this.onAddNewTransaction});
  void addNewTransaction() {
    final enteredAmount = double.parse(amountController.text);
    if (titleController.text == '') {
      return;
    }
    if (amountController.text == '' || enteredAmount < 0) {
      return;
    }
    onAddNewTransaction(titleController.text, enteredAmount);
  }

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
              // the underscore means that we do not care about the value
              // the reason we have to use it is because onSubmitted always requires a string but we do not use the string so (_) is used
              onSubmitted: (_) => addNewTransaction(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // controller property is used for mapping the values in the TextEditController
              controller: amountController,
              // use the keyboard type attribute to choose the type of keyboard
              keyboardType: TextInputType.number,
              // the underscore means that we do not care about the value
              // the reason we have to use it is because onSubmitted always requires a string but we do not use the string so (_) is used
              onSubmitted: (_) => addNewTransaction(),
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
              onPressed: addNewTransaction,
            )
          ],
        ),
      ),
    );
  }
}
