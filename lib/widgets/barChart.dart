import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final String chartLabel;
  final double amount;
  final double fillPercent;

  BarChart({this.amount, this.chartLabel, this.fillPercent});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // we use this toStringAsFixed to round off the decimal places
        // As it is 0 then it will not have any decimal places
        // If it was 1 then it would round off to one decimal
        Container(
          height: 20,
          child: FittedBox(
            child: Text('\$${amount.toStringAsFixed(0)}'),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: fillPercent > 0 ? fillPercent : 0,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(chartLabel)
      ],
    );
  }
}
