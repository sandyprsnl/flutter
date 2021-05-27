import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addtx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  NewTransaction({this.addtx});

  void submitedData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    addtx(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      padding: EdgeInsets.all(10),
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
        TextField(
          decoration: InputDecoration(
            labelText: 'Title',
          ),
          controller: titleController,
          onSubmitted: (_) => submitedData(),
        ),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Amount',
          ),
          controller: amountController,
          onSubmitted: (_) => submitedData(),
        ),
        TextButton(
          onPressed: submitedData,
          child: Text('Add Transactions'),
          style: TextButton.styleFrom(primary: Colors.purple),
        ),
      ]),
    ));
  }
}
