import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  // use this text editing comtroller to capture the input value in the variable
  final Function onAddNewTransaction;

  NewTransaction({this.onAddNewTransaction});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void addNewTransaction() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredAmount = double.parse(_amountController.text);
    if (_titleController.text == '' ||
        enteredAmount < 0 ||
        _selectedDate == null) {
      return;
    }
    widget.onAddNewTransaction(
        _titleController.text, enteredAmount, _selectedDate);
    // to close the top most screen use the navigator.pop method
    Navigator.of(context).pop();
  }

  void openDatePickerModal() {
    // showDatePicker is inbuilt method for date picker modal.
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((date) {
      if (date == null) {
        return;
      }
      ;
      setState(() {
        _selectedDate = date;
      });
    });
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
              controller: _titleController,
              // the underscore means that we do not care about the value
              // the reason we have to use it is because onSubmitted always requires a string but we do not use the string so (_) is used
              onSubmitted: (_) => addNewTransaction(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // controller property is used for mapping the values in the TextEditController
              controller: _amountController,
              // use the keyboard type attribute to choose the type of keyboard
              keyboardType: TextInputType.number,
              // the underscore means that we do not care about the value
              // the reason we have to use it is because onSubmitted always requires a string but we do not use the string so (_) is used
              onSubmitted: (_) => addNewTransaction(),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(_selectedDate == null
                      ? 'No Date chosen'
                      : 'Selected Date: ${DateFormat.yMd().format(_selectedDate)}'),
                ),
                FlatButton(
                  onPressed: openDatePickerModal,
                  child: Text(
                    'Choose Date',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                )
              ],
            ),
            RaisedButton(
              padding: EdgeInsets.all(10),
              child: Text(
                'Add',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: addNewTransaction,
            )
          ],
        ),
      ),
    );
  }
}
