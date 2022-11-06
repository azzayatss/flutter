import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;
import '../constants/routes.dart';
import '../utilities/show_error_dialog.dart';



class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  
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
      appBar: AppBar(title: const Text('Sign In')),
      body: Column(
            children: [
              TextField(
              style: const TextStyle(color: Colors.white),
                controller: _emailContoller,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Color.fromARGB(194, 101, 101, 101)),
                    hintText: 'Enter you email here'
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
                  hintText: 'Enter your password here'
              )
              ),
              TextButton(
                  onPressed: () async {
                    final email = _emailContoller.text;
                    final password =_passwordContoller.text;
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email,
                      password: password);
                      devtools.log('login success');
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        notesRoute,
                        (_) => false);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        await showErrorDialog(context, 'User not found, check email correctness or try to Sign up');
                      } else if (e.code == 'wrong-password'){
                         await showErrorDialog(context, 'Oops - wrong password, try again');
                      } else {
                        await showErrorDialog(
                          context, 
                          'Error: ${e.code}');
                      }
                    } catch (e) {
                      await showErrorDialog(context, 
                      e.toString());
                    } 
              },
              child: const Text('Sign In'),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                  child: Text(
                    'Not yet registered???\nClick button below to Sign Up',
                    style: 
                      TextStyle(
                        color: Colors.white, 
                        fontStyle: FontStyle.italic),),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: 
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).pushNamedAndRemoveUntil(signUpRoute,
                       (route) => false);
                    },
                    child: const Text ('Create new account') 
                  ) ,
              ),
              
            ],
          ),
    ); 
  }
}



 
