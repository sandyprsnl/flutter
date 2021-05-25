import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  
   // String titleInput;
  // String amountInput;
  final titleController= TextEditingController();
  final amountController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
                  child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.end,
                  children: <Widget>[                  
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                    // onChanged: (val){
                    //   titleInput= val;
                    // },
                    controller: titleController,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Amount',
                    ),
                    // onChanged:(val){
                    //   amountInput= val;
                    // } ,
                    controller: amountController ,
                  ),
                  TextButton(onPressed: (){
                    print(titleController.text);
                    print(amountController.text);
                    },
                   child: Text('Add Transactions'),
                   style: TextButton.styleFrom(primary: Colors.purple),
                   ),
                ]
                ),
              )
              );
  }
}