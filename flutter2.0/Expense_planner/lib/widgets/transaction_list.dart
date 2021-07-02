import 'package:flutter/rendering.dart';

import '../models/transaction.dart';

import 'package:flutter/material.dart';

import './transaction_item.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTx;

  TransactionsList({this.transaction, this.deleteTx});
  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'Not Transactions added Yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView(
            children: transaction
                .map((tx) => TransactionItem(
                    key: ValueKey(tx.id), transaction: tx, deleteTx: deleteTx))
                .toList(),
            // itemCount: transaction.length,
            // itemBuilder: (context, index) {
            //   return TransactionItem(
            //       transaction: transaction[index], deleteTx: deleteTx);
            // },
          );
  }
}
