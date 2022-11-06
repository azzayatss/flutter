import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lerningdart/utilities/show_error_dialog.dart';
import 'package:lerningdart/utilities/show_success_dialog.dart';
import 'dart:developer' as devtools;
import '../constants/routes.dart'; 

// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

  late final TextEditingController _emailContoller;
  late final TextEditingController _passwordContoller;

@override
  void initState() {
    _emailContoller = TextEditingController();
    _passwordContoller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
   _emailContoller.dispose();
   _passwordContoller.dispose(); 
    super.dispose();
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(173, 69, 65, 65),
      appBar: AppBar(title: const Text('Sign Up')),
      body: Column(
            children: [
              TextField(
                style: const TextStyle(color: Colors.white),
                controller: _emailContoller,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Color.fromARGB(194, 101, 101, 101)),
                    hintText: 'email'
                    ),
               ),
              TextField(
                style: const TextStyle(color: Colors.white),
                controller: _passwordContoller,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Color.fromARGB(194, 101, 101, 101)),
                  hintText: 'password'
              )
              ),
              TextButton(
                  onPressed: () async {
                    final email = _emailContoller.text;
                    final password =_passwordContoller.text;
                    try {
                      await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                      );
                      final user = FirebaseAuth.instance.currentUser;
                      await user?.sendEmailVerification();
                      Navigator.of(context).pushNamed(verifyEmailRoute);
                      // showSuccessRegistrationDialog(
                      //   context, 
                      //   'user successfully registered, now you can Sign In');
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        showErrorDialog(
                          context, 
                          'Your password is too weak: Minimum Password Length should be at least six characters or more'
                          );
                      } else if (e.code == 'email-already-in-use'){
                        showErrorDialog(
                          context, 
                          'This email is already in use, try to Sign In'
                          );
                      } else if (e.code == 'invalid-email'){
                        showErrorDialog(
                          context, 
                          'Please type a correct email'
                          );
                      } else {
                        await showErrorDialog(
                          context, 
                          'Error: ${e.code}');
                      }
                    devtools.log('user successfully registered');
                  } catch (e) {
                      await showErrorDialog(context, 
                      e.toString());
                    }   
              },
              child: const Text('Sign Up'),
              ),
              const Align(
              alignment: Alignment.centerLeft,
                child: Text(
                  'Already registred?',
                  style: 
                  TextStyle(
                    color: Colors.white ,
                    fontStyle: FontStyle.italic
                    ),),),
               Align(
              alignment: Alignment.centerLeft,
                child: TextButton(onPressed: (){
                  Navigator.of(context).pushNamedAndRemoveUntil(signInRoute,
                   (route) => false);
                } ,
                 child: const Text('Sign In')))
            ],
          ),
    ); 
  }
}

