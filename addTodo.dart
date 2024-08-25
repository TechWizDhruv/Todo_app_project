import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddTodo extends StatefulWidget {
  void Function({required String todoText}) addTodo;
  AddTodo({super.key, required this.addTodo});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController todoText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Add Todo"),
        TextField(
          onSubmitted: (value) {
            if (todoText.text.isNotEmpty) {
              widget.addTodo(todoText: todoText.text);
            }

            todoText.text = "";
          },
          autofocus: true,
          decoration: InputDecoration(
            hintText: "Write your todo here ",
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          controller: todoText,
        ),
        ElevatedButton(
            onPressed: () {
              if (todoText.text.isNotEmpty) {
                widget.addTodo(todoText: todoText.text);
              }

              todoText.text = "";
            },
            child: Text("Add"))
      ],
    );
  }
}
