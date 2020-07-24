import 'package:flutter/material.dart';
import './transaction_item.dart';
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
        : ListView(
            children: _userTransactions
                .map((e) => TransactionItem(
                    key: ValueKey(e.id),
                    userTransactions: e,
                    deleteTransactions: _deleteTransactions))
                .toList(),
          );
  }
}
