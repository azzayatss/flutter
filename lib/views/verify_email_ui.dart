import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/routes.dart';
//! насадити ui на діючий функціонал

class VerifyEmailUi extends StatefulWidget {
  const VerifyEmailUi({super.key});

  @override
  State<VerifyEmailUi> createState() => _VerifyEmailUiState();
}

class _VerifyEmailUiState extends State<VerifyEmailUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff161553),
      body: Stack(
        children: [
          Positioned(
            top: 52,
            left: 24,
            child: TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(signUpRoute, (route) => false);
              },
              child: const Text(
                '⬅️ BACK',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              //! замінити цю кнопку на іконку
            ),
          ),
          Positioned(
            width: 375,
            top: 106,
            left: 21,
            // right: 56,
            // bottom: 582,
            child: Text(
              'Please verify your email to continiue using app, and to have possibility to sign in',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                fontSize: 26,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              )),
            ),
          ),
          Positioned(
            width: 375,
            top: 258,
            left: 21,
            // right: 76,
            // bottom: 553,
            child: Text(
              'An email has been automatically sent to your inbox, open it and follow the link inside the email. After confirming that you have been verified, you can log in to the application.',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            width: 375,
            top: 370,
            left: 21,
            // right: 76,
            // bottom: 553,
            child: Text(
              'If you did not recieve any emails from us, please check your spam folder.',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            width: 375,
            top: 425,
            left: 21,
            // right: 76,
            // bottom: 553,
            child: Row(
              children: [
                Text(
                  'If spam folder is empty, than plese click',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                  ),
                  onPressed: () {},
                  child: Text(
                    'here',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Color(0xffA1C92E),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            width: 375,
            top: 475,
            left: 21,
            child: Text(
              'In case you did everything according to the instructions but nothing happens, you need to restart the application ⬇',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            width: 375,
            top: 555,
            left: 21,
            // right: 76,
            // bottom: 553,
            child: Row(
              children: [
                Text(
                  'By clicking',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                  ),
                  onPressed: () {},
                  child: Text(
                    'here',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Color(0xffA1C92E),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
