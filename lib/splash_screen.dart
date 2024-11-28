import 'package:flutter/material.dart';
import 'dart:async'; // For handling the delay

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  double _opacity = 0.0; // Initial opacity set to 0 for fade-in effect

  @override
  void initState() {
    super.initState();

    // Fade in animation
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        setState(() {
          _opacity = 1.0; // Set opacity to 1 to make it fully visible
        });
      }
    });

    // Navigate to the homepage after 5 seconds
    Timer(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(seconds: 1), // Duration for the fade-in effect
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Logo
              Image.asset(
                'assets/logo/guideme2.jpg',
                width: 200,
                height: 150,
              ),
              const SizedBox(height: 20),
              // Show loading GIF after 2 seconds
              FutureBuilder(
                future: Future.delayed(const Duration(seconds: 3)),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Image.asset(
                      'assets/logo/loading.gif', // Loading GIF path
                      width: 50,
                      height: 50,
                    );
                  } else {
                    return Container(); // Show nothing before the delay
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
