import 'package:flutter/material.dart';
import 'user_auth.dart'; // Import your UserAuth provider
import 'profile_guest_page.dart';
import 'register.dart';
import 'login.dart';
import 'package:provider/provider.dart';
import 'homepage.dart';
import 'ticket_page.dart';
import 'search_page.dart';
import 'gallery_page.dart';
import 'profile_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserAuth(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(), // Home page
        '/ticket': (context) => const TicketPage(), // Ticket page
        '/search': (context) => const SearchPage(), // Blog page
        '/gallery': (context) => const GalleryPage(), // Gallery page
        '/profile': (context) {
          // Check if the user is logged in
          final userAuth = Provider.of<UserAuth>(context);
          return userAuth.isLoggedIn ? const ProfilePage() : const GuestProfile();
        },
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
