import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/routes.dart';
import '../services/auth/auth_exceptions.dart';
import '../services/auth/auth_service.dart';
import '../utilities/show_error_dialog.dart';

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
            // right: 56,
            // bottom: 582,
            child: Text(
              'Welcome to ACARiS',
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
            left: 104,
            // right: 76,
            // bottom: 553,
            child: Text(
              'Animal Care Intelligent Systems',
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
                          .logIn(email: email, password: password);
                      // devtools.log('login success');
                      final user = AuthService.firebase().currentUser;
                      if (user?.isEmailVerified ?? false) {
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil(notesRoute, (_) => false);
                      } else {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            verifyEmailRoute, (_) => false);
                      }
                    } on UserNotFoundAuthException {
                      await showErrorDialog(context,
                          'User not found, check email correctness or try to Sign up');
                    } on WrongPasswordAuthExcetion {
                      await showErrorDialog(
                          context, 'Oops - wrong password, try again');
                    } on GenericAuthException {
                      await showErrorDialog(context, 'Authentication Error');
                    }
                  },
                  child: Text(
                    'Sign In',
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
            top: 599,
            left: 143,
            // right: 125,
            // bottom: 192,
            child: TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(forgotPasswordRoute, (_) => false);
              },
              //!добавити раутінг на пустий екран який зроблю згодом
              child: Text('Forgot Password?',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Color(0xffA1C92E),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
          ),
          Positioned(
            top: 741,
            left: 98,
            child: Row(
              children: [
                Text('Dont have an account?',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Color(0xff97A8D0),
                      ),
                    )),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil(signUpRoute, (route) => false);
                  },
                  child: Text('Sign Up',
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
