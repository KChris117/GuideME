import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'homepage.dart';
import 'ticket_page.dart';
import 'search_page.dart';
import 'gallery_page.dart';
import 'profile_page.dart' as profile;
import 'register.dart' as register;
import 'login.dart' as login;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi Firebase dengan FirebaseOptions untuk platform web
  if (Firebase.apps.isEmpty) {
    if (kIsWeb) {
      const firebaseConfig = FirebaseOptions(
        apiKey: "AIzaSyA651vHDymZ3aEhDNcMudBH7v2vV1Nv2-w",
        authDomain: "guideme-117.firebaseapp.com",
        projectId: "guideme-117",
        storageBucket: "guideme-117.firebasestorage.app",
        messagingSenderId: "519757623779",
        appId: "1:519757623779:web:97094baa6f97d76fa8f0d6",
        measurementId: "G-HKWKBGL7KX"
      );
      await Firebase.initializeApp(options: firebaseConfig);
    } else {
      await Firebase.initializeApp();
    }
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/': (context) => const MyHomePage(),
        '/ticket': (context) => const TicketPage(),
        '/search': (context) => const SearchPage(),
        '/gallery': (context) => const GalleryPage(),
        '/profile': (context) => const profile.ProfilePage(),
        '/login': (context) => const login.LoginPage(),
        '/register': (context) => const register.RegisterPage(),
      },
    );
  }
}
