import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  Todo({
    super.key,
    required this.task,
    required this.status,
  });

  String task;
  bool status;

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white10,
      ),
      margin: EdgeInsets.only(
        left: 12,
        right: 12,
        top: 12,
      ),
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Checkbox(
            checkColor: Colors.white,
            activeColor: Colors.deepOrangeAccent,
            value: widget.status,
            onChanged: (value) => {
              setState(() {
                widget.status = !widget.status;
              })
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
