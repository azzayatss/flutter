

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(173, 69, 65, 65),
      appBar: 
        AppBar(title: const Text('Your Notes'),
        actions: [
          PopupMenuButton<MenuAction>(
            onSelected:(value) async {
              switch (value) {
                case MenuAction.logout:
                  final shouldLogout = await showLogOutDialog(context);
                  if (shouldLogout){
                    FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      '/sign-in/',
                      (_) => false);
                  }
                  break;
              }
            }, 
            itemBuilder: (context) {
              return const [
                PopupMenuItem<MenuAction>(
                value: MenuAction.logout, 
                child: Text('Log out'))
              ];
              
            }, 
            )
        ],),
      body: const Text('Hello World!'),
      );
  }
}