import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;
  final Function _deleteTransactions;

  TransactionList(this._userTransactions, this._deleteTransactions);

  @override
  Widget build(BuildContext context) {
    return _userTransactions.isEmpty
        ? Column(
            children: <Widget>[
              const Text(
                'No Transactions yet!',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 50,
                width: 10,
              ),
              Container(
                height: 200,
                child: Image.asset(
                  'images/waiting.png',
                  fit: BoxFit.cover,
                ),
              )
            ],
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                            child: Text(
                                'Rs ${_userTransactions[index].ammount}'))),
                  ),
                  title: Text(
                    _userTransactions[index].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(_userTransactions[index].date),
                  ),
                  trailing: FlatButton.icon(
                    icon: const Icon(Icons.delete),
                    label: const Text(
                      'Delete',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    textColor: Theme.of(context).errorColor,
                    onPressed: () =>
                        _deleteTransactions(_userTransactions[index].id),
                  ),
                ),
              );
            },
            itemCount: _userTransactions.length,
          );
  }
}
