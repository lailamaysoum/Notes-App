import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  final String contentText;
  final Function confirmFunction;
  final Function declineFunction;

  AlertDialogWidget({
    this.contentText,
    this.confirmFunction,
    this.declineFunction,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        contentText,
      ),
      actions: [
        TextButton(
          onPressed: declineFunction,
          child: Text("No"),
        ),
        TextButton(
          onPressed: confirmFunction,
          child: Text("Yes"),
        ),
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialogWidget(
          contentText: 'Are you sure you want to delete this item?',
          confirmFunction: () {
            // Action to perform if user confirms
            Navigator.pop(context);
          },
          declineFunction: () {
            // Action to perform if user declines
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text('Delete Item'),
          onPressed: () {
            _showDialog(context);
          },
        ),
      ),
    );
  }
}
