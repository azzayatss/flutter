import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../firebase_options.dart';

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
      // scafold - стандартне рішення яке має в собі аппбар і тіло
      // todo вивчити всі можливості скалафорду
      backgroundColor: const Color.fromARGB(173, 69, 65, 65),
      appBar: AppBar(title: const Text('Sign In Page')), 
      body: FutureBuilder(
        future: Firebase.initializeApp(
          //Firebase.initializeApp() needs to call native code to initialize Firebase, 
          //тобто ми простка кажемо "ей флаттер ми тут юзаєм firebase, знай про це))"
          options: DefaultFirebaseOptions.currentPlatform),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            
          case ConnectionState.done:
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
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: email,
                    password: password);
                    print('login success');
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      print('User not found in Firebase');
                    } else if (e.code == 'wrong-password'){
                      print('The password is wrong');
                    }
                  }
                  // 3 той приклад що зверху
                  // 2
                  //on FirebaseAuthException catch (e) {
                  //   print(e.code);
                  // }

                  //1
                  //catch (e) {
                  //   print('Something went wrong');
                  //   print(e.runtimeType);
                  //   print(e);
                  // }
                  
            },
            child: const Text('Sign In'),
            )
          ],
        ); 
         default: 
         return const Text('Loading...');
          }
        
        },
      )); 
  }
  }

 
