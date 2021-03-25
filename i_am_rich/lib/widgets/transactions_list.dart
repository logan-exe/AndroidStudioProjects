import 'package:flutter/material.dart';

import "../models/transaction.dart";
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions,this.deleteTransaction);

  void _deleteTransaction() {
    print("deleted");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(children: <Widget>[
              Text("No transactions added yet!"),
              SizedBox(
                height: 10,
              ),
              Container(height: 200, child: Image.asset("assets/images/waiting.png", fit: BoxFit.cover)),
            ])
          : ListView.builder(
              // crossAxisAlignment: CrossAxisAlignment.start,
              itemBuilder: (context, index) {
                return Card(
                    elevation: 5,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 100,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Colors.black,
                            width: 2,
                          )),
                          child: Text(
                            '\$${transactions[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                transactions[index].title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(DateFormat.yMMMd().format(transactions[index].date)),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => deleteTransaction(transactions[index].id),
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ));
              },
              itemCount: transactions.length,

              // children: transactions.map((e) {
              //   return
              // }).toList(),
            ),
    );
  }
}
