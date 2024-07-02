import 'package:flutter/material.dart';
import 'package:qr_code_scanner_generator/login.dart';
import 'package:qr_code_scanner_generator/Registration.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'bg2.jpg',
            fit: BoxFit.fill,
          ),
          // Content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30), 
              Text(
                'Welcome To The App',
                style: GoogleFonts.concertOne(
                  color:Colors.white,
                  fontSize:48,
                  fontStyle:FontStyle.italic,
                ),
              ),
              SizedBox(height: 40), // Adjust height as needed
              Image.asset(
                'qr.jpg',
                height: 300,
                width: 300,
              ),
              SizedBox(height: 30), 
              ElevatedButton(
                onPressed: () {
                 Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RegistrationScreen(),
            ),
          );
                },
                child: Text('Sign Up'),
              ),
              // Adjust height as needed
              
              SizedBox(height: 10), 
               Text(
                'Already have an account?',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10), 
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );
                },
                child: Text('Login'),
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}
