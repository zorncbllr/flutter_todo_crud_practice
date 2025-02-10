import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todo extends StatefulWidget {
  String task;
  bool completed;
  Function(bool?) onStateChanged;
  Function(BuildContext context) onDelete;

  Todo({
    super.key,
    required this.task,
    required this.completed,
    required this.onDelete,
    required this.onStateChanged,
  });

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: widget.onDelete,
              icon: Icons.delete,
              backgroundColor: Colors.deepOrangeAccent,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),

        // todo container
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 8,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white12,
          ),
          child: Row(
            children: [
              Checkbox(
                activeColor: Colors.deepOrangeAccent,
                value: widget.completed,
                onChanged: widget.onStateChanged,
              ),
              Text(
                widget.task,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
