import 'package:flutter/material.dart';

class InputBar extends StatefulWidget {
  TextEditingController controller;
  VoidCallback createNewTodo;

  InputBar({
    super.key,
    required this.controller,
    required this.createNewTodo,
  });

  @override
  _InputBarState createState() => _InputBarState();
}

class _InputBarState extends State<InputBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: TextField(
              controller: widget.controller,
              decoration: InputDecoration(
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepOrangeAccent,
                  ),
                ),
                focusColor: Colors.orangeAccent,
                fillColor: Colors.white12,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          IconButton(
            color: Colors.deepOrangeAccent,
            onPressed: widget.createNewTodo,
            icon: Icon(Icons.send),
          )
        ],
      ),
    );
  }
}
