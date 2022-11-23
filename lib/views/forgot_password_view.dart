import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lerningdart/constants/routes.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  '/Users/test/azzayatss/Flutter/FlutterProjects/FirstFlutterProject/lerningdart/lib/assets/images/sign_in.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 100,
          left: 177,
          child: Image.asset(
            '/Users/test/azzayatss/Flutter/FlutterProjects/FirstFlutterProject/lerningdart/lib/assets/images/logo.png',
            height: 75,
            width: 75,
          ),
        ),
        Positioned(
          width: 262,
          height: 39,
          top: 191,
          left: 84,
          child: Text(
            'Forgot Password',
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
              fontSize: 26,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            )),
          ),
        ),
        Positioned(
          top: 238,
          left: 44,
          child: Text(
            'Sorry but this feature does not implemented yet',
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            )),
          ),
        ),
        Positioned(
          top: 267,
          left: 64,
          child: Row(children: [
            const Text(
              'you can go back to',
              style: TextStyle(color: Colors.white),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(signInRoute, (route) => false);
              },
              child: const Text(
                'Sign In',
                style: TextStyle(
                  color: Color(0xffA1C92E),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Text(
              'or',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(signInRoute, (route) => false);
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  color: Color(0xffA1C92E),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ]

              // TextButton(onPressed: () {} , child: Text(''),),
              ),
        ),
      ],
    ));
  }
}
