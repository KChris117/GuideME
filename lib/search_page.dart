import 'package:flutter/material.dart';
import 'detail_1page.dart';
import 'detail_2page.dart';
import 'transaction_detail_1page.dart';
import 'transaction_detail_2page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedIndex = 2; // Gallery tab

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
        title: Row(
          children: [
            const SizedBox(width: 1), // Add some space between the text and the search bar
            Expanded(
              child: Container(
                height: 40,
                padding: const EdgeInsets.only(right: 5), // Add some space to the right of the search bar
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(color: Colors.black, width: 1)
                ),
                child: TextField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search, size: 20), // Add a "Search" logo to the left side of the text
                    prefixIconConstraints: BoxConstraints(minHeight: 25, minWidth: 50), // Set the alignment of the prefixIcon to the center
                    contentPadding: EdgeInsets.only(left: 20, right: 20), // Add some space to the right of the "Search GuideMe" text
                    border: InputBorder.none,
                    hintText: 'Search GuideMe...',
                    hintStyle: TextStyle(fontSize: 14),
                  ),
                  onChanged: (text) {
                    // Handle the user's input here
                    ('Search query: $text');
                  },
                ),
              ),
            ),
          ],
        ),
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
              title: const Text('TicketPage'),
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Hi, Tourist!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                ),
              ),
              const Text(
                'Start Your Best Experience With GuideMe',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0), // Memberikan jarak vertikal
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Nearby Location',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                          // Arahkan ke halaman lain saat "See More" ditekan
                          Navigator.pushReplacementNamed(context, '/yourPageRoute');
                        },
                        child: const Text(
                          'See More',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black, // Warna teks "See More"
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: _buildPlaceCard(
                    'Makam Tumenggung Abdul Jamal', 
                    'Batam Center, Indonesia', 
                    'place_pictures/makam_abdul_jamal.jpg'
                  )),
                  const SizedBox(width: 10),
                  Expanded(child: _buildPlaceCard(
                    'Taman Miniature House Indonesia', 
                    'Batam Center, Indonesia', 
                    'place_pictures/miniatur_house.jpeg'
                  )),
                ],
              ),

                const SizedBox(height: 20),


                Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0), // Memberikan jarak vertikal
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recommended Beach Destination',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                          // Arahkan ke halaman lain saat "See More" ditekan
                          Navigator.pushReplacementNamed(context, '/yourPageRoute');
                        },
                        child: const Text(
                          'See More',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black, // Warna teks "See More"
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: _buildPlaceCard(
                    'Pantai Raviola', 
                    'Batam Center, Indonesia', 
                    'tickets/raviola.jpeg'
                  )),
                  const SizedBox(width: 10),
                  Expanded(child: _buildPlaceCard(
                    'Pantai Melur', 
                    'Batam Center, Indonesia', 
                    'tickets/melur.jpg'
                  )),
                ],
              ),
             
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  'Guide Me',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Made by PBL-IF-12',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
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

  Widget _buildPlaceCard(String title, String description, String imagePath) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start, // Align column contents to the left
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(15.0), // Rounded corners for the white box
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align column contents to the left
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            // Align the title text to the left
            Text(
              title,
              textAlign: TextAlign.left, // Align text to the left
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            // Add description text below the title and above the stars
            Text(
              description,
              textAlign: TextAlign.left, // Align text to the left
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 2),
            // Stars row aligned to the left
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.star, color: Colors.yellow[700], size: 15), // Star 1
                Icon(Icons.star, color: Colors.yellow[700], size: 15), // Star 2
                Icon(Icons.star, color: Colors.yellow[700], size: 15), // Star 3
                Icon(Icons.star, color: Colors.yellow[700], size: 15), // Star 4
                Icon(Icons.star_half, color: Colors.yellow[700], size: 15), // Half-star for 4.5 rating
                const SizedBox(width: 0.1),
              ],
            ),
          ],
        ),
      ),
      

      const SizedBox(height: 15),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // MouseRegion for 'Detail' button with finger pointer cursor
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            if (title == 'Makam Tumenggung Abdul Jamal') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TransactionDetail1Page()),
              );
            } else if (title == 'Miniature House Indonesia') {
          Navigator.push(
            context,
          MaterialPageRoute(builder: (context) => const TransactionDetail2Page()),
        );
      }
    },
        child: const Center(
          child: Text(
            'Free',
            style: TextStyle(
              color: Colors.grey, // Warna teks
              fontSize: 12, // Ukuran teks
            ),
          ),
        ),

            ),
          ),

          const SizedBox(height: 8),

          // MouseRegion for 'Transaction Detail' button with finger pointer cursor
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                if (title == 'Makam Tumenggung Abdul Jamal') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Detail1Page()),
                  );
                } else if (title == 'Taman Miniature House Indonesia') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Detail2Page()),
                  );
                }
              },
              child: Container(
                width: 50,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: const Center(
                  child: Text(
                    'View',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),

                ),
              ),
            ),
          ),

        ],
      ),
    ],
  );
}
}