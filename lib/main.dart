// todo 1: add snackbar to signup page "registration is success please log in now"
// todo 2: add auto formating https://docs.flutter.dev/development/tools/formatting
// todo 3 розіратись якого хуя в мене не відпрацьовує вирівнювання в імейл веріф файлі
// ?? - nреба пояснення, все шариш до моменту коли не почалась історія з стовренням папки сервісес і всіх наступних файлів. 
// ?? для чого матеріал дарт? чому його підключення виправляє багато помилок коли ми створюємо нові файли в лібі? 
// ?? простими словами коли юзати async 

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lerningdart/constants/routes.dart';
import 'package:lerningdart/views/my_notes_view.dart';
import 'package:lerningdart/views/sign_up_view.dart';
import 'package:lerningdart/views/sign_in_view.dart';
import 'package:lerningdart/views/verify_email_view.dart';
import 'firebase_options.dart';
// import 'dart:developer' as devtools show log; 

//імпортнули сюди інші файлм в яких лежить інші куски коду, це робиться так)

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( const App());
  //the WidgetFlutterBinding is used to interact with the Flutter engine.
  //Firebase.initializeApp() needs to call native code to initialize Firebase, 
  //and since the plugin needs to use platform channels to call the native code, 
  //which is done asynchronously therefore you have to call ensureInitialized() 
  //to make sure that you have an instance of the WidgetsBinding.
}



class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo', 
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        // home: const NotesView (),
        home: const HomePage (),
        routes: {
          signInRoute:(context) => const SignInView(),
          signUpRoute:(context) => const SignUpView(),
          notesRoute:(context) => const NotesView(),
          verifyEmailRoute:(context) => const VerifyEmailView(),
        }
      );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

   @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // todo розібратись з фючер білдером
        future: Firebase.initializeApp(
          //Firebase.initializeApp() needs to call native code 
          //to initialize Firebase, 
          //тобто ми простка кажемо "ей флаттер 
          //ми тут юзаєм firebase, знай про це))"
          options: DefaultFirebaseOptions.currentPlatform),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
            case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              if (user.emailVerified){
                return const NotesView();
                } else {
                return const VerifyEmailView();
                }
              } else {
                return const SignInView();
              }
              default: 
              return const CircularProgressIndicator();
          }
        },
      );
  }
}

enum MenuAction { logout }



Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog<bool> (
    context: context,
    builder: (context) {
      return  AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            }, 
            child: const Text('Cancel')),
          TextButton(
            onPressed:(){
              Navigator.of(context).pop(true);
            }, 
            child: const Text('EXIT')),
        ],
      );
    },
    ).then((value) => value ?? false );
}



  






