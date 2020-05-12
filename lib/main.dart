import 'package:flutter/material.dart';
import './widgets/user_transaction.dart';

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: Text('Personal Expenses'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Card(
                  child: Text('Graph will come here'),
                  elevation: 5,
                  color: Colors.red[400],
                ),
                //combination of new transaction and list of transaction will come here
                UserTransaction(),
              ],
            )),
      ),
    );
  }
}
