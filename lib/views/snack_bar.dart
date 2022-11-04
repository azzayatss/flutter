import 'package:flutter/material.dart';
// import 'dart:developer' as devtools;

class SnackBarTest extends StatelessWidget {
  const SnackBarTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snack Bar'),),
        body: Column(
          children: [
            TextButton(
              onPressed: () {
                 SnackBar(content: const Text('data'),
                action: SnackBarAction(label: 'label', onPressed: (){}));
                // devtools.log('message');
              },
              child: const Text('try it'))
          ], 
        ),
    );
  }
}

