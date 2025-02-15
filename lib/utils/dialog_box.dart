import 'package:flutter/material.dart';

class DialogBox extends StatefulWidget {
  DialogBox({
    super.key,
    required this.controller,
    required this.onSubmit,
    required this.onCancel,
  });

  TextEditingController controller;
  VoidCallback onSubmit;
  VoidCallback onCancel;

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 41, 41, 41),
      content: SizedBox(
        height: 150,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: widget.onCancel,
                  icon: Icon(
                    Icons.cancel_outlined,
                    color: Colors.white24,
                  ),
                )
              ],
            ),
            Expanded(child: SizedBox()),
            TextField(
              controller: widget.controller,
              onSubmitted: (_) => widget.onSubmit(),
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromARGB(43, 255, 109, 64),
                  ),
                ),
              ),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            TextButton(
              onPressed: widget.onSubmit,
              child: Text(
                'Create',
                style: TextStyle(
                  color: Colors.deepOrangeAccent,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
