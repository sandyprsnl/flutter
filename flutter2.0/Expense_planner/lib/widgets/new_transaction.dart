import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addtx;

  NewTransaction({this.addtx});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  DateTime _selectedDate;

  void _submitedData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addtx(enteredTitle, enteredAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
          controller: _titleController,
          onSubmitted: (_) => _submitedData(),
        ),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Amount',
          ),
          controller: _amountController,
          onSubmitted: (_) => _submitedData(),
        ),
        Container(
          height: 70,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(_selectedDate == null
                    ? 'No date Choosen!'
                    : 'Picked Date : ${DateFormat.yMd().format(_selectedDate)}'),
              ),
              TextButton(
                  style: TextButton.styleFrom(
                      textStyle:
                          TextStyle(color: Theme.of(context).primaryColor)),
                  onPressed: _presentDatePicker,
                  child: Text(
                    'Choose Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
        ElevatedButton(
          onPressed: _submitedData,
          child: Text(
            'Add Transactions',
            // style: TextStyle(color: Colors.amber),
          ),
          style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor,
              textStyle:
                  TextStyle(color: Theme.of(context).textTheme.button.color)),
        ),
      ]),
    ));
  }
}
