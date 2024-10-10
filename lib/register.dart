import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key}); // Convert 'key' to a super parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Register',
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
                'Welcome!',
                style: GoogleFonts.inter(
                  fontSize: 35,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Create Your GuideME Account',
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

              const Divider(thickness: 1, color: Colors.black), // Divider below text
              
              const SizedBox(height: 40), // Space after the divider

              Text(
                'Email',
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

              const Divider(thickness: 1, color: Colors.black), // Divider below text

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

              const Divider(thickness: 1, color: Colors.black), // Divider below text

              const SizedBox(height: 40), // Space after the divider

              Text(
                'Verify Password',
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

              const Divider(thickness: 1, color: Colors.black), // Divider below text

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
                  // Perform registration logic here
                  Navigator.pop(context); // Go back to the previous page
                },
                child: Align(
                  alignment: Alignment.center, // Center the text inside the button
                  child: Text(
                    'Register',
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
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Already have an account? Login here',
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
