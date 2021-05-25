import 'package:intl/intl.dart';

import '../models/transaction.dart';
import 'package:flutter/material.dart';
class TransactionsList extends StatefulWidget {
  @override
  _TransactionsListState createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  
  final List<Transaction> _userTransactions=[
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New shirt', amount: 79.99, date: DateTime.now()),
  
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
                  children: _userTransactions.map((tx) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        )),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '\$ ${tx.amount}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            tx.title,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat().format(tx.date),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList());
  }
}