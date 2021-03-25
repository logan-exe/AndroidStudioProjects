import 'package:flutter/material.dart';
import 'package:i_am_rich/widgets/new_transaction.dart';

import "./models/transaction.dart";
import './widgets/transactions_list.dart';
import "./widgets/chart.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense tracker',
      theme: ThemeData(primarySwatch: Colors.red, accentColor: Colors.yellow[900], fontFamily: 'Quicksand'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // final List<Transaction> transactions = [
  //   Transaction(id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
  //   Transaction(id: 't2', title: 'Travel', amount: 199.99, date: DateTime.now()),
  // ];
  // String titleInput;
  // String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: "My Travel",
    //   amount: 100.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: "hello",
    //   amount: 100.99,
    //   date: DateTime.now(),
    // ),
  ];
  List<Transaction> get _recentTransactions {
    return _userTransactions.where((item) {
      return item.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }
    void _deleteTransaction(String deleteId) {
    setState(() {
     _userTransactions.removeWhere((val) => val.id == deleteId);
    });
  }

  void _addNewTransaction(String title, double amount, DateTime chosenDate) {
    if (title == "" || amount <= 0) {
      return;
    }
    final newTransaction = Transaction(
      title: title,
      amount: amount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransactions.add(newTransaction);
    });
    Navigator.of(context).pop();
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Expense Tracker',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
            )
          ]),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // Text("hello world"),

            // Container(
            //   width: double.infinity,
            //   height: 100,
            //   child: Card(
            //     child: Center(child: Text("this is a card")),
            //     color: Theme.of(context).primaryColor,
            //     elevation: 5,
            //   ),
            // ),
            Chart(_recentTransactions),
            TransactionList(_userTransactions,_deleteTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        // focusColor: Theme.of(context).accentColor,
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
