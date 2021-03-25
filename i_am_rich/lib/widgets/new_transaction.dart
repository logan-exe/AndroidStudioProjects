import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  DateTime _selectedDate;

  void _presentdatePicker() {
    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2021), lastDate: DateTime.now()).then((val) {
      if (val != null) {
        // print("hello");
        // print(val);
        setState(() {
           _selectedDate = val;
        });
       
      }
      return;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              // onChanged: (val) {
              //   titleInput = val;
              // },
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (val) {
              //   amountInput = val;
              // },
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(_selectedDate == null ? "No date Chosen!" : "Picked Date: "+DateFormat.yMd().format(_selectedDate)),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(_selectedDate == null ?"select date": "Edit"),
                    onPressed: _presentdatePicker,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              child: Text("Add"),
              // textColor: Theme.of(context).primaryColor,
              onPressed: () {
                widget.addTransaction(titleController.text, double.parse(amountController.text),_selectedDate);
                // print(titleController.text);
                // print(titleInput);
                // transactions.add({id: "t3", title: ""});
              },
            ),
          ],
        ),
      ),
    );
  }
}
