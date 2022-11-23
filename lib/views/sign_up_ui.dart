import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lerningdart/constants/routes.dart';
//! Насадити Ui на діючий функціонал
//! спробувати розширити цей скрін до функціоналу згідно дизайну з чекбоксами, подвійним паролем і т.д.

class SignUpUi extends StatefulWidget {
  const SignUpUi({super.key});

  @override
  State<SignUpUi> createState() => _SignUpUiState();
}

class _SignUpUiState extends State<SignUpUi> {
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
            top: 52,
            left: 24,
            child: TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(signInRoute, (route) => false);
              },
              child: const Text(
                'BACK',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              //! замінити цю кнопку на іконку
            ),
          ),
          Positioned(
            // top: 92,
            // left: 84,
            top: 161,
            left: 84,
            child: Text(
              'Create new account',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                fontSize: 26,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              )),
            ),
          ),
          Positioned(
            // top: 139,
            // left: 95,
            top: 208,
            left: 104,
            child: Text(
              'Enter the following details to sign up',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              )),
            ),
          ),
          Positioned(
            top: 299,
            right: 24,
            left: 24,
            bottom: 465,
            child: TextField(
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Colors.white,
                ),
              ),
              // controller: _emailContoller,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  hintStyle: TextStyle(
                    color: Color(0xff97A8D0),
                  ),
                  hintText: 'Email'),
              //! закінчив тут, спробувати додати іконки до інпутів
            ),
          ),
          Positioned(
            top: 371,
            right: 24,
            left: 24,
            bottom: 393,
            child: TextField(
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Colors.white,
                ),
              ),
              // controller: _passwordContoller,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(
                  hintStyle: TextStyle(
                    color: Color(0xff97A8D0),
                  ),
                  hintText: 'Password'),
            ),
          ),
          Positioned(
            top: 515,
            left: 52,
            child: Container(
              width: 327,
              height: 52,
              decoration: const ShapeDecoration(
                shape: StadiumBorder(),
                gradient: LinearGradient(
                  colors: [
                    Color(0xff265CA1),
                    Color(0xff3B94C6),
                    Color(0xff00BF9D),
                    Color(0xffA1C92E),
                  ],
                ),
              ),
              child: SizedBox(
                width: 327,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Create Account',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
