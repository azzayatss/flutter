import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    return Column(
          children: [
            TextField(
            style: const TextStyle(color: Colors.white),
              controller: _emailContoller,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.deepPurple),
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
                hintStyle: TextStyle(color: Colors.deepPurple),
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
                    password: password);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('Your password is too weak');
                    } else if (e.code == 'email-already-in-use'){
                      print('This email is already in use, try to Sign In');
                    } else if (e.code == 'invalid-email'){
                      print('Please type a correct email');
                    }
                    
                  }
                  
            },
            child: const Text('Sign Up'),
            )
          ],
        ); 
  }
}



