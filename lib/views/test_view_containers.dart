import 'package:flutter/material.dart';
import 'dart:developer' as devtools;

class TestContainersView extends StatelessWidget {
  const TestContainersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
        Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
                image:  DecorationImage(
                  image:  AssetImage('/Users/test/azzayatss/Flutter/FlutterProjects/FirstFlutterProject/lerningdart/lib/assets/images/sign_in.png'),
                  fit: BoxFit.cover
                  )
              ),
            child: 
              Column(
                children: [
                  Image.asset('/Users/test/azzayatss/Flutter/FlutterProjects/FirstFlutterProject/lerningdart/lib/assets/images/logo.png'),
                  const Text('data'),
                  const Text('data'),
                  const TextField(
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration:  InputDecoration(
                      hintStyle: TextStyle(color: Colors.white),
                      hintText: 'Enter your email here' 
                      )
                  ),
                  const TextField(
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration:  InputDecoration(
                      hintStyle: TextStyle(color: Colors.white),
                      hintText: 'Enter your password here' 
                      )
                  ),
                  Container(
                    decoration:
                      ShapeDecoration( 
                        shape: Border.all(),
                        gradient: const LinearGradient(
                           colors:[
                             Color(0xff265CA1),
                             Color(0xff3B94C6),
                             Color(0xff00BF9D),
                             Color(0xffA1C92E),
                          ] 
                        )
                      ),
                    child: ElevatedButton(
                    onPressed: (){}, 
                    child: const Text('asdas')
                  ), 
                     

                  ),
                  




                ] 
              ),
       ),
    );
      
  }
}