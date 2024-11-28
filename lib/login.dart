import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;  // Untuk mengontrol apakah password terlihat atau tidak

  Future<void> _login() async {
  try {
    // Login the user
    final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    // Check if the email is verified
    if (userCredential.user?.emailVerified ?? false) {
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Email not verified! Please verify your email.'),
      ));

      // Optionally, send the email verification again
      await userCredential.user?.sendEmailVerification();
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Login failed: $e'),
    ));
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          '',
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
                'LOGIN',
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
                'Email',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 10), // Space before the TextField

              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter your email here...',
                  hintStyle: TextStyle(color: Colors.grey),
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

              TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible, // Mengubah apakah password disembunyikan
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter your password here...',
                  hintStyle: TextStyle(color: Colors.grey),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible; // Toggle visibility
                      });
                    },
                  ),
                ),
              ),
              const Divider(thickness: 1, color: Colors.grey), // Divider below text
              const SizedBox(height: 50), // Space after the divider

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(
                    300,
                    MediaQuery.of(context).size.height * 0.08, // Height will adjust based on the screen size (7% of screen height)
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5), // Rounded corners
                  ),
                  backgroundColor: Colors.black, // Button color
                ),
                onPressed: _login,
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

              Center(
                child: TextButton(
                  onPressed: () async {
                    try {
                      final user = FirebaseAuth.instance.currentUser;
                      if (user != null && !user.emailVerified) {
                        await user.sendEmailVerification();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Verification email resent. Please check your inbox.'),
                        ));
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Failed to resend verification email: $e'),
                      ));
                    }
                  },
                  child: Text(
                    'Resend verification email',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: Colors.blue,
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
