import 'package:flutter/material.dart';
import 'dart:developer' as devtools;

class SnackBarTest extends StatelessWidget {
  const SnackBarTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snack Bar'),),
        body: const SnackBarBody()
      );
  }
}

class SnackBarBody extends StatelessWidget {
  const SnackBarBody({super.key});

  void  showSnackBar(BuildContext context) {
    const snackBar =  SnackBar(content: Text('Snackbar message'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            TextButton(
              onPressed: () {
                showSnackBar(context);
              },
              child: const Text('try it'))
          ], 
        );
  }
}

