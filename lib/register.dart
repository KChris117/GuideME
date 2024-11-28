import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

bool _obscurePassword = true;

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Fungsi untuk registrasi
  Future<void> _register() async {
    try {
      if (_formKey.currentState!.validate()) {
        print("Validating form...");

        // Register the user using Firebase Authentication
        final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        // Update the display name with the username
        await userCredential.user?.updateDisplayName(_usernameController.text.trim());

        // Kirim email verifikasi
        await userCredential.user?.sendEmailVerification();

        // Tampilkan pesan sukses
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Verification Email Sent"),
            content: const Text(
                "A verification email has been sent to your email address. Please verify your email."),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Arahkan ke halaman login jika sudah
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: const Text("OK"),
              ),
            ],
          ),
        );
      } else {
        print("Form is invalid!");
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Registration failed';

      // Handle specific errors
      if (e.code == 'email-already-in-use') {
        errorMessage = 'This email is already in use. Please choose another one.';
      } else if (e.code == 'weak-password') {
        errorMessage = 'The password is too weak. Please choose a stronger password.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'The email address is invalid. Please enter a valid email.';
      }

      // Show error message if registration fails
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
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
                'REGISTER',
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
              const SizedBox(height: 10),
              const Divider(thickness: 1, color: Colors.grey),
              const SizedBox(height: 50),

              // Form for username, email, and password
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    // Username Field
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Username',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your username...',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a username';
                        }
                        return null;
                      },
                    ),
                    const Divider(thickness: 1, color: Colors.black),
                    const SizedBox(height: 40),

                    // Email Field
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Email',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your email...',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email...';
                        }
                        if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const Divider(thickness: 1, color: Colors.black),
                    const SizedBox(height: 40),

                    // Password Field
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Password',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword, // Gunakan _obscurePassword untuk menyembunyikan/menampilkan password
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your password...',
                        hintStyle: const TextStyle(color: Colors.grey),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_off : Icons.visibility, // Ikon berganti
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            // Ubah nilai _obscurePassword ketika tombol ditekan
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password...';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const Divider(thickness: 1, color: Colors.black),
                    const SizedBox(height: 50),

                    // Register Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(
                          300,
                          MediaQuery.of(context).size.height * 0.08,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        backgroundColor: Colors.black,
                      ),
                      onPressed: _register,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Register',
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Link to Login Page
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
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
            ],
          ),
        ),
      ),
    );
  }
}
