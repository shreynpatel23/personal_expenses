import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/widgets/barChart.dart';
import '../services/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get recentTransactionData {
    return List.generate(7, (index) {
      // use the subtract method to get each day.
      // we need to pass Duration of days which we get it from the index (in the parameter than is give by generator)
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalExpendeture = 0.0;
      // we need to iterate through each for transaction in recentTransaction
      for (var i = 0; i < recentTransaction.length; i++) {
        // as the date object consist of date month and year so we need to check all the three parameters here.
        // by that we can come to know the expendeture of each day.
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
          totalExpendeture += recentTransaction[i].amount;
        }
      }
      // to get the each day initial like M,T,W ... we use the intl package which has an inbuilt method E() to extract each day inital
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 2),
        'amount': totalExpendeture
      };
    });
  }

  double get totalSpending {
    return recentTransactionData.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: recentTransactionData.map((recentTransaction) {
            return Expanded(
              child: BarChart(
                amount: recentTransaction['amount'],
                chartLabel: recentTransaction['day'],
                fillPercent:
                    (recentTransaction['amount'] as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
