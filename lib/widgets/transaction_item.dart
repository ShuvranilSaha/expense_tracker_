import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required Transaction userTransactions,
    @required Function deleteTransactions,
  })  : _userTransactions = userTransactions,
        _deleteTransactions = deleteTransactions,
        super(key: key);

  final Transaction _userTransactions;
  final Function _deleteTransactions;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColors;
  @override
  void initState() {
    const availableColors = [
      Colors.greenAccent,
      Colors.amberAccent,
      Colors.deepPurpleAccent,
      Colors.blueGrey
    ];
    _bgColors = availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColors,
          radius: 30,
          child: Padding(
              padding: const EdgeInsets.all(6),
              child: FittedBox(
                  child: Text('Rs ${widget._userTransactions.ammount}'))),
        ),
        title: Text(
          widget._userTransactions.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget._userTransactions.date),
        ),
        trailing: FlatButton.icon(
          icon: const Icon(Icons.delete),
          label: const Text(
            'Delete',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          textColor: Theme.of(context).errorColor,
          onPressed: () =>
              widget._deleteTransactions(widget._userTransactions.id),
        ),
      ),
    );
  }
}
