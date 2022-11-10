

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools;

import '../constants/routes.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Email Verification 🚨')),
      body : 
        Column( 
          children : [
              const Text('We have sent you an email verification ✉️'),
              const Text('Please check your emails 👀'),
              const Text('If you havent recieve an email, click button below 👇'),
              TextButton(
                onPressed: () async {
                  final user = FirebaseAuth.instance.currentUser;
                  await user?.sendEmailVerification();
                  devtools.log('mail was sent');
                  devtools.log(user.toString());
                  // ?? треба пояснення по фючербілдер чи фючер + евейт + асинк,
                  // ?? що б було якби я не прописав евейт?
                }, 
                child: const Text('Send email verification')),
                TextButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(signInRoute, (route) => false);
              
                  }, 
                  child: const Text('restart'))
              ]
            )
      );
  }
}