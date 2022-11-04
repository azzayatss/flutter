
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// ?? для чого матеріал дарт? (це для андро?), чого тоді для іос нічого додаткового не підключаємо?
import 'package:lerningdart/views/sign_up_view.dart';
import 'package:lerningdart/views/sign_in_view.dart';

import 'firebase_options.dart';
//імпортнули сюди інші файлм в яких лежить інші куски коду, це робиться так)

Future<void> main() async {
  // ?? чому коли юзаємо флаттер байндінг то добавляємо future + async, а якщо ні то не добавляємо?
  WidgetsFlutterBinding.ensureInitialized();
  runApp( const App());
  //the WidgetFlutterBinding is used to interact with the Flutter engine.
  //Firebase.initializeApp() needs to call native code to initialize Firebase, 
  //and since the plugin needs to use platform channels to call the native code, 
  //which is done asynchronously therefore you have to call ensureInitialized() 
  //to make sure that you have an instance of the WidgetsBinding.
}
// ?? треба пояснення, на хлопський ( void - class - widget), 
// ?? яка різниця, чому саме така послідовність, що в яких випадках юзати.


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
        home: const HomePage (),
        routes: {
          '/sign-in/':(context) => const SignInView(),
          '/sign-up/':(context) => const SignUpView(),
        },
        // home: const HomePage(),
        // ?? пробував додати якусь наступну сторінку але не зрозумів як, 
        // ?? де шукати всі варіанти, в кмнд + клік по матіріал апу не найшов))
        
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
          //Firebase.initializeApp() needs to call native code to initialize Firebase, 
          //тобто ми простка кажемо "ей флаттер ми тут юзаєм firebase, знай про це))"
          options: DefaultFirebaseOptions.currentPlatform),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            
          case ConnectionState.done:
        //   final user = FirebaseAuth.instance.currentUser;
    
        //   if (user?.emailVerified ?? false) { 
        //     return const Text('Done');
        // } else { 
        //    return const VerifyEmailView();
        //   }
        return const SignInView();
         default: 
         return const CircularProgressIndicator();
          }
        
        },
      );
  }
}



  






