import 'package:flutter/material.dart';
import 'package:i_am_rich/models/transaction.dart';
import "../models/transaction.dart";
import 'package:intl/intl.dart';
import "./chart_bar.dart";

class Chart extends StatefulWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;
      for (var i = 0; i < widget.recentTransactions.length; i++) {
        if (widget.recentTransactions[i].date.day == weekDay.day && widget.recentTransactions[i].date.month == weekDay.month && widget.recentTransactions[i].date.year == weekDay.year) {
          totalSum += widget.recentTransactions[i].amount;
        }
      }
      // print({'day': DateFormat.E().format(weekDay), 'amount': totalSum});
      return {'day': DateFormat.E().format(weekDay).substring(0, 1), 'amount': totalSum};
    });
  }

  double get maxSpending {
    return groupedTransactionValues.fold(0.0, (start, item) => start + item['amount']);
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Container(
     
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.reversed.map((data) {
            return ChartBar(
              data['day'],
              data['amount'],
              maxSpending == 0 ? 0 :  (data["amount"] as double) / maxSpending,
            );
          }).toList(),
        ),
      ),
    );
  }
}
