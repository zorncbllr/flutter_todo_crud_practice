import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  String task;
  bool completed;
  bool marked;

  Todo({
    super.key,
    required this.task,
    this.completed = false,
    this.marked = false,
  });

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white12,
      ),
      child: Row(
        children: [
          Checkbox(
            activeColor: Colors.deepOrangeAccent,
            value: widget.completed,
            onChanged: (value) {
              setState(() {
                widget.completed = !widget.completed;
              });
            },
          ),
          Text(
            widget.task,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
