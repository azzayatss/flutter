import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestContainersView extends StatelessWidget {
  const TestContainersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.red,
            ),
            image: const DecorationImage(
              image: AssetImage(
                  '/Users/test/azzayatss/Flutter/FlutterProjects/FirstFlutterProject/lerningdart/lib/assets/images/sign_in.png'),
              fit: BoxFit.cover,
            )),
        child: Column(children: [
          Image.asset(
              '/Users/test/azzayatss/Flutter/FlutterProjects/FirstFlutterProject/lerningdart/lib/assets/images/logo.png'),
          Text(
            'Welcome to ACARiS',
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
              fontSize: 26,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
          ),
          Text(
            'Animal Care Intelligent Systems',
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            )),
          ),
          const TextField(
              style: TextStyle(color: Colors.white),
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: 'Email')),
          const TextField(
              style: TextStyle(color: Colors.white),
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: 'Password')),
          Container(
            decoration: ShapeDecoration(
              shape: Border.all(),
              gradient: const LinearGradient(
                colors: [
                  Color(0xff265CA1),
                  Color(0xff3B94C6),
                  Color(0xff00BF9D),
                  Color(0xffA1C92E),
                ],
              ),
            ),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {},
                child: const Text('Sign In')),
          ),
          TextButton(onPressed: () {}, child: const Text('Forgot Password?')),
          Row(
            children: [
              const Text('Dont have an account?'),
              TextButton(onPressed: () {}, child: const Text('Sign Up')),
            ],
          ),
          Container(
            decoration: ShapeDecoration(
              shape: Border.all(),
              gradient: const LinearGradient(
                colors: [
                  Color(0xff265CA1),
                  Color(0xff3B94C6),
                  Color(0xff00BF9D),
                  Color(0xffA1C92E),
                ],
              ),
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(46),
                  ),
                ),
              ),
              onPressed: () {},
              child: const Text('data'),
            ),
          )
        ]),
      ),
    );
  }
}
