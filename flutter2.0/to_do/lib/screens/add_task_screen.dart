import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 30,
                color: Colors.green[400],
              ),
            ),
            TextField(
              onChanged: ((value) {}),
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder().copyWith(
                  borderSide:
                      const BorderSide(width: 3, color: Colors.greenAccent),
                ),
                border: const UnderlineInputBorder().copyWith(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 102, 187, 106), width: 5),
                ),
                focusedBorder: const UnderlineInputBorder().copyWith(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 102, 187, 106), width: 5),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.green[400]),
              onPressed: () {},
              child: const Text(
                'Add',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
