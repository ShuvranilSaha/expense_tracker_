import 'package:flutter/material.dart';

class NewTransactions extends StatefulWidget {
  final Function addNewTransactions;

  NewTransactions(this.addNewTransactions);

  @override
  _NewTransactionsState createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final titleController = TextEditingController();

  final ammountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmmount = double.parse(ammountController.text);

    if (enteredTitle.isEmpty || enteredAmmount <= 0) {
      return;
    }
    widget.addNewTransactions(
      enteredTitle,
      enteredAmmount,
    );
    Navigator.of(context).pop();
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
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Ammount'),
              controller: ammountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              onPressed: submitData,
              child: Text('Add Transaction'),
              textColor: Colors.indigo,
            )
          ],
        ),
      ),
    );
  }
}
