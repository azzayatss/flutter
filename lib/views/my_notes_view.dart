


import 'package:flutter/material.dart';
import 'package:lerningdart/services/auth/auth_service.dart';
import 'dart:developer' as devtools;
import '../constants/routes.dart';
import '../enums/menu_action.dart';


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
        AppBar(title: const Text('Your Notes test 📝'),
        actions: [
          PopupMenuButton<MenuAction>(
            onSelected:(value) async {
              switch (value) {
                case MenuAction.logout:
                  final shouldLogout = await showLogOutDialog(context);
                  if (shouldLogout){
                   await AuthService.firebase().logOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                     signInRoute,
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
      body: Column(
        children: [
          const Text('Hello world 👋'),
          TextButton(onPressed: () {
            devtools.log(AuthService.firebase().currentUser.toString());
          }, child: const Text('Show User\n in console'))
        ],
        )
      
      );
  }
}

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