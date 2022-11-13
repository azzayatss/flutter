


import 'package:flutter/material.dart';
import 'package:lerningdart/services/auth/auth_service.dart';
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
                  await AuthService.firebase().sendEmailVerification();
                  devtools.log('mail was sent');
                }, 
                child: const Text('Send email verification')),
                TextButton(
                  onPressed: () async {
                    await AuthService.firebase().logOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(signInRoute, (route) => false);
              
                  }, 
                  child: const Text('restart'))
              ]
            )
      );
  }
}