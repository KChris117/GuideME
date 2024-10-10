import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_auth.dart';
import 'register.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key}); // Convert 'key' to a super parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Welcome Back!',
                style: GoogleFonts.inter(
                  fontSize: 35,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Log in to start planning your trip',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),
              
              const SizedBox(height: 10), // Space before the divider
              
              const Divider(thickness: 1, color: Colors.grey), // Divider below text

              const SizedBox(height: 50), // Space after the divider

              Text(
                'Username',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 10), // Space before the TextField

              const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none, // No border
                  hintText: '', 
                  hintStyle: TextStyle(color: Colors.black), // Hint text style
                ),
              ),

              const Divider(thickness: 1, color: Colors.grey), // Divider below text

              const SizedBox(height: 40), // Space after the divider
              Text(
                'Password',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              
              const SizedBox(height: 10), // Space before the TextField

              const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none, // No border
                  hintText: '', 
                  hintStyle: TextStyle(color: Colors.black), // Hint text style
                ),
              ),

              const Divider(thickness: 1, color: Colors.grey), // Divider below text

              const SizedBox(height: 50), // Space after the divider

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // Manually change the width here
                  minimumSize: Size(
                    300, // Replace this with your desired width
                    MediaQuery.of(context).size.height * 0.08, // Height will adjust based on the screen size (7% of screen height)
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5), // Rounded corners
                  ),
                  backgroundColor: Colors.black, // Button color
                ),
                onPressed: () {
                  // Perform your login logic here
                  Provider.of<UserAuth>(context, listen: false).login();
                  Navigator.pop(context); // Go back to the main page
                },
                child: Align(
                  alignment: Alignment.center, // Center the text inside the button
                  child: Text(
                    'Login',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      color: Colors.white, // Text color
                    ),
                  ),
                ),
              ),


              const SizedBox(height: 20), // Space between buttons
              Center(
                child: TextButton(
                  onPressed: () {
                    // Navigate to the registration page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Don\'t have an account? Register here',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
