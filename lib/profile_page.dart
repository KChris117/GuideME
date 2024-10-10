import 'package:flutter/material.dart';
import 'package:guide_me/choose_language.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'show_profile_page.dart';
import 'user_auth.dart';
import 'homepage.dart';

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
        // Navigate to Home
        Navigator.pushReplacementNamed(context, '/');
        break;
      case 1:
        // Navigate to Blog
        Navigator.pushReplacementNamed(context, '/ticket');
        break;
      case 2:
        // Navigate to Search
        Navigator.pushReplacementNamed(context, '/search');
        break;
      case 3:
        // Navigate to Gallery
        Navigator.pushReplacementNamed(context, '/gallery');
        break;
      case 4:
        // Navigate to Profile
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
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
              Text(
                'Edit Profile With Your Preference',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 10), // Space before the divider
              const Divider(thickness: 1, color: Colors.grey), // Divider below text

              const SizedBox(height: 45), // Space after the divider

              // Profile Logo with ListTile below
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile section with avatar and name
                  Row(
                    children: [
                      // Profile Logo
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('profiles/profile.jpg'),
                      ),
                      
                      const SizedBox(width: 20), 
                      // Space between avatar and text

                  // Name text next to profile picture
                  Expanded(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Archeus', // Example name
                        style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  const SizedBox(height: 2),
                    Text(
                      'Show Profile', // Optional subtitle, can be removed
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                  IconButton(
                    icon: const Icon(Icons.chevron_right),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ShowProfile(), // Navigate to ShowProfile page
                          ),
                        );
                      },
                    ),
                    
                  ],
                ),
              ]
            ),

          
                  
              const SizedBox(height: 5), // Space before the divider
              const Divider(thickness: 1, color: Colors.grey), // Divider below text
              const SizedBox(height: 25), // Space after the divider

              Text(
                'Settings',
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              const SizedBox(height: 8), // Space after the divider
              
                  // List options (Edit Profile, Change Language, Logout)
                  ListTile(
                    leading: const Icon(Icons.person_2),
                    title: const Text('Personal Information'),
                    trailing: const Icon(Icons.chevron_right),  // Chevron icon
                    onTap: () {
                      // Handle edit profile
                    },
                  ),
              const SizedBox(height: 2), // Space before the divider
              const Divider(thickness: 1, color: Colors.grey), // Divider below text
              const SizedBox(height: 5), // Space after the divider
                  ListTile(
                    leading: const Icon(Icons.language),
                    title: const Text('Languages'),
                    trailing: const Icon(Icons.chevron_right),  // Chevron icon
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChooseLanguage(),
                        ),
                      );
                    },
                  ),
              const SizedBox(height: 2), // Space before the divider
              const Divider(thickness: 1, color: Colors.grey), // Divider below text
              const SizedBox(height: 5), // Space after the divider
                  ListTile(
                    leading: const Icon(Icons.notifications),
                    title: const Text('Notification'),
                    trailing: const Icon(Icons.chevron_right),  // Chevron icon
                    onTap: () {
                      
                    },
                  ),
              const SizedBox(height: 2), // Space before the divider
              const Divider(thickness: 1, color: Colors.grey), // Divider below text
              const SizedBox(height: 5), // Space after the divider
                  ListTile(
                    leading: const Icon(Icons.history),
                    title: const Text('History'),
                    trailing: const Icon(Icons.chevron_right),  // Chevron icon
                    onTap: () {
                      // Handle edit profile
                    },
                  ),
              const SizedBox(height: 2), // Space before the divider
              const Divider(thickness: 1, color: Colors.grey), // Divider below text
              const SizedBox(height: 5), // Space after the divider
                  ListTile(
                    leading: const Icon(Icons.question_mark),
                    title: const Text('Get Help'),
                    trailing: const Icon(Icons.chevron_right),  // Chevron icon
                    onTap: () {
                      // Handle logout
                    },
                  ),
              const SizedBox(height: 2), // Space before the divider
              const Divider(thickness: 1, color: Colors.grey), // Divider below text
              const SizedBox(height: 5), // Space after the divider
                  ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                trailing: const Icon(Icons.chevron_right),  // Chevron icon
                onTap: () {
                  // Handle logout
                  Provider.of<UserAuth>(context, listen: false).logout(); // Logout from UserAuth
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHomePage()), // Navigate to HomePage
                    (route) => false, // Removes all previous routes
                  );
                },
              ),
              const SizedBox(height: 2), // Space before the divider
              const Divider(thickness: 1, color: Colors.grey), // Divider below text
              const SizedBox(height: 5), // Space after the divider
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
