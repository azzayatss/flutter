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
    final snackBar =  SnackBar(
      content: const Text('Registratin Done -> now you need to:'),
      action: SnackBarAction(
        label: 'Sign In',
        onPressed: (){
          devtools.log('redirecting o login page');
        }
        ),
        );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
            children: [
              TextButton(
                onPressed: () {
                  showSnackBar(context);
                },
                child: const Text('Sign up'))
            ], 
          ),
    );
  }
}

