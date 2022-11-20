import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestContainersStackView extends StatelessWidget {
  const TestContainersStackView({super.key});

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
              obscureText: false,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(
                  // suffixIcon: Icon(),
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
            // right: 24,
            // bottom: 245,
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
            right: 125,
            left: 124,
            bottom: 192,
            child: TextButton(
              onPressed: () {},
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
            right: 67,
            left: 67,
            bottom: 50,
            child: Row(
              children: [
                Text('Dont have an account?',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Color(0xff97A8D0),
                      ),
                    )),
                TextButton(
                  onPressed: () {},
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
          const Text('data')
        ],
      ),
    );
  }
}

// ElevatedButton(
//             style: ButtonStyle(
//               shape: MaterialStatePropertyAll(
//                 RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(46),
//                 ),
//               ),
//             ),
//             onPressed: () {},
//             child: const Text('data'),
//           )
