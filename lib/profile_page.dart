import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guide_me/choose_language.dart';
import 'package:guide_me/user_detail.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 4; // Profile tab

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Add navigation logic or other actions here based on index
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/ticket');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/search');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/gallery');
        break;
      case 4:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }

Future<String?> _getProfileImageUrl() async {
  final user = FirebaseAuth.instance.currentUser;
  final doc = await FirebaseFirestore.instance
      .collection('user_profile_detail')
      .doc(user?.uid)
      .get();

  if (doc.exists) {
    return doc.data()?['profile_image_url'];
  }
  return null;
}

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    // If the user is logged in, navigate directly to the homepage.
    if (user != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, '/homepage');
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(''),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
            ListTile(
              leading: const Icon(Icons.auto_awesome_motion),
              title: const Text('Ticket'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/ticket');
              },
            ),
            ListTile(
              leading: const Icon(Icons.search),
              title: const Text('Search'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/search');
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Gallery'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/gallery');
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_box),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/profile');
              },
            ),
          ],
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
                'Your Profile',
                style: GoogleFonts.inter(
                  fontSize: 35,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 20),
            // Jika pengguna sudah login, tampilkan foto profil
            
              // Teks yang berubah tergantung pada status login dan verifikasi email
              user == null || !user.emailVerified
                  ? Text(
                      'Log in to start planning your trip',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    )
                  : Text(
                      'Edit profile with your preference',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
              const SizedBox(height: 10),
              const Divider(thickness: 1, color: Colors.grey),
              const SizedBox(height: 50),

              // Profile Logo with ListTile below
              user == null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(150, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  backgroundColor: Colors.black,
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/login');
                                },
                                child: Text(
                                  'Login',
                                  style: GoogleFonts.inter(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(150, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  backgroundColor: Colors.black,
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/register');
                                },
                                child: Text(
                                  'Register',
                                  style: GoogleFonts.inter(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30), // Tambahkan jarak di sini
                      ],
                    )
                    
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        user == null || !user.emailVerified
                            ? Text(
                                'Log in to start planning your trip',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                ),
                              )
                            : Row(
                                children: [
                                  // Foto Profil di Samping Teks Welcome
                                  user == null
                                      ? const SizedBox(
                                          width: 100,
                                          height: 100,
                                          child: Icon(Icons.account_circle, size: 100),
                                        )
                                      : FutureBuilder<String?>(
                                          future: _getProfileImageUrl(),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState == ConnectionState.waiting) {
                                              return const CircularProgressIndicator();
                                            }
                                            String? profileImageUrl = snapshot.data;
                                            return CircleAvatar(
                                              radius: 50,
                                              backgroundImage: profileImageUrl != null && profileImageUrl.isNotEmpty
                                                  ? NetworkImage(profileImageUrl)
                                                  : const AssetImage('assets/images/default_profile.png') as ImageProvider,
                                            );
                                          },
                                        ),
                                  const SizedBox(width: 10), // Jarak antara foto dan teks
                                  user != null && user.emailVerified
                                      ? Text(
                                          '${user.displayName ?? 'User'}',
                                          style: GoogleFonts.inter(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      : Text(
                                          'Email not verified. Please verify your email to see your profile.',
                                          style: GoogleFonts.inter(
                                            fontSize: 16,
                                            color: Colors.red,
                                          ),
                                        ),
                                ],
                              ),
                        const SizedBox(height: 5),
                        const Divider(thickness: 1, color: Colors.grey),
                        const SizedBox(height: 25),
                      ],
                    ),
              Text(
                'Settings',
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Visibility(
                visible: user != null && user.emailVerified, // Menyembunyikan jika email belum diverifikasi
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.person_2),
                      title: const Text('Personal Information'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UserDetail(),
                          ),
                        );
                      }, 
                    ),
                    const SizedBox(height: 2),
                    const Divider(thickness: 1, color: Colors.grey),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.language),
                title: const Text('Languages'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChooseLanguage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 2),
              const Divider(thickness: 1, color: Colors.grey),
              const SizedBox(height: 5),
              Visibility(
                visible: user != null && user.emailVerified, // Menyembunyikan jika email belum diverifikasi
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.notifications),
                      title: const Text('Notification'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {},
                    ),
                    const SizedBox(height: 2),
                    const Divider(thickness: 1, color: Colors.grey),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
              Visibility(
                visible: user != null && user.emailVerified, // Menyembunyikan jika email belum diverifikasi
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.history),
                      title: const Text('History'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {},
                    ),
                    const SizedBox(height: 2),
                    const Divider(thickness: 1, color: Colors.grey),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.question_mark),
                title: const Text('Get Help'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
              const SizedBox(height: 2),
              const Divider(thickness: 1, color: Colors.grey),
              const SizedBox(height: 5),
              Visibility(
                visible: user != null,
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text('Logout'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: user != null
                          ? () async {
                              await FirebaseAuth.instance.signOut();
                              Navigator.pushReplacementNamed(context, '/profile');
                            }
                          : null,
                    ),
                    const SizedBox(height: 2),
                    const Divider(thickness: 1, color: Colors.grey),
                    const SizedBox(height: 300),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_awesome_motion),
            label: 'Ticket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'Gallery',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}
