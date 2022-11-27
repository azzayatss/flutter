import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lerningdart/services/auth/auth_exceptions.dart';
import 'package:lerningdart/services/auth/auth_service.dart';
import 'package:lerningdart/utilities/show_error_dialog.dart';

import '../constants/routes.dart';

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
              controller: _emailContoller,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  hintStyle: TextStyle(
                    color: Color(0xff97A8D0),
                  ),
                  hintText: 'Email'),
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
              controller: _passwordContoller,
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
                  onPressed: () async {
                    final email = _emailContoller.text;
                    final password = _passwordContoller.text;
                    try {
                      await AuthService.firebase()
                          .createUser(email: email, password: password);
                      AuthService.firebase().sendEmailVerification();
                      Navigator.of(context).pushNamed(verifyEmailRoute);
                      // showSuccessRegistrationDialog(
                      //   context,
                      //   'user successfully registered, now you can Sign In');
                    } on WeakPasswordAuthException {
                      showErrorDialog(context,
                          'Your password is too weak: Minimum Password Length should be at least six characters or more');
                    } on EmailAlreadyInUseAuthException {
                      showErrorDialog(context,
                          'This email is already in use, try to Sign In');
                    } on InvalidEmailAuthException {
                      showErrorDialog(context, 'Please type a correct email');
                    } on GenericAuthException {
                      await showErrorDialog(context, 'Failed to register');
                    }
                  },
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
          Positioned(
            top: 741,
            left: 98,
            child: Row(
              children: [
                Text('Already registered?',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Color(0xff97A8D0),
                      ),
                    )),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil(signInRoute, (route) => false);
                  },
                  child: Text('Sign In',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Color(0xffA1C92E),
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
