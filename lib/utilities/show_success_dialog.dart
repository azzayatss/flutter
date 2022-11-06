import 'package:flutter/material.dart';
import 'package:lerningdart/constants/routes.dart';

Future<void> showSuccessRegistrationDialog(
  BuildContext context, 
  String text,
  ) {
    return showDialog(
      context: context, 
      builder: (context) {
      return  AlertDialog(
        title: const Text('Success'),
        content: Text(text),
        actions: [
          TextButton(
            onPressed: () {
              // Navigator.of(context).pop();
              Navigator.of(context).pushNamedAndRemoveUntil(signInRoute, (route) => false);
            }, 
            child: const Text('Sign In')
            )
         ],
        );
      }
    );
  }