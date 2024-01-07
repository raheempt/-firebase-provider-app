
import 'package:firebase_provider/view/Login.dart';
import 'package:firebase_provider/view/elavatedbutton.dart';
import 'package:firebase_provider/view/singup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(226, 221, 220, 220),
      body: Container(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          const   SizedBox(
              height: 110,
            ),
                 Icon(
                  Icons.apple,
                  size: 100,
                ),
        
         const    SizedBox(
              height: 50,
            ),
            Text(
              'Welcome ToDo',
              style: GoogleFonts.raleway(
                  fontSize: 45, fontWeight: FontWeight.w700),
            ),
          const  Text(
              '...',
              style: TextStyle(
                  fontSize: 105, color: Color.fromARGB(225, 29, 27, 27)),
            ),
         const   SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyElevatedButton(
                    width: 135,
                    colors: Colors.white,
                    color: Color.fromARGB(255, 12, 12, 12),
                    buttonText: 'Login',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => login_page()));
                    }),
               const  SizedBox(
                  width: 30,
                ),
                MyElevatedButton(
                    width: 135,
                    colors: const Color.fromARGB(255, 247, 246, 246),
                    color: Color.fromARGB(255, 20, 16, 16),
                    buttonText: 'Sign Up',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => signup_page()));
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}