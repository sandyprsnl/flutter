import 'package:flutter/rendering.dart';

import '../models/transaction.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

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
        : ListView.builder(
            itemCount: transaction.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                          child: Text('\$ ${transaction[index].amount}')),
                    ),
                  ),
                  title: Text(
                    transaction[index].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle:
                      Text(DateFormat.yMMMd().format(transaction[index].date)),
                  trailing: MediaQuery.of(context).size.width > 460
                      ? TextButton.icon(
                          style: TextButton.styleFrom(
                            primary: Theme.of(context).errorColor,
                          ),
                          onPressed: () => deleteTx(transaction[index].id),
                          icon: Icon(Icons.delete),
                          label: Text('Delete'))
                      : IconButton(
                          onPressed: () => deleteTx(transaction[index].id),
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                        ),
                ),
              );
            },
          );
  }
}
