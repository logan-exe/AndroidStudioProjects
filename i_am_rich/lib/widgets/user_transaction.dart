// import 'package:flutter/material.dart';
// import './new_transaction.dart';
// import './transactions_list.dart';
// import '../models/transaction.dart';

// class UserTransactions extends StatefulWidget {
//   @override
//   _UserTransactionsState createState() => _UserTransactionsState();
// }

// class _UserTransactionsState extends State<UserTransactions> {
//   final List<Transaction> _userTransactions = [
//     Transaction(
//       id: 't1',
//       title: "My Travel",
//       amount: 100.99,
//       date: DateTime.now(),
//     ),
//     Transaction(
//       id: 't2',
//       title: "hello",
//       amount: 100.99,
//       date: DateTime.now(),
//     ),
//   ];

//   void _addNewTransaction(String title, double amount) {
//     if (title == "" || amount <= 0) {
//       return;
//     }
//     final newTransaction = Transaction(
//       title: title,
//       amount: amount,
//       date: DateTime.now(),
//       id: DateTime.now().toString(),
//     );
//     setState(() {
//       _userTransactions.add(newTransaction);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         NewTransaction(_addNewTransaction),
//         TransactionList(_userTransactions),
//       ],
//     );
//   }
// }
