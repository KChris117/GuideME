import 'package:flutter/material.dart';
import 'detail_1page.dart';
import 'detail_2page.dart';
import 'transaction_detail_1page.dart';
import 'transaction_detail_2page.dart';
import 'see_more.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0; // Track the selected index for BottomNavigationBar

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
        title: const Text('Home'),
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
              
              Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Colors.grey.withOpacity(1), // Adjust the opacity to make the image darker
                          BlendMode.multiply,
                          ),
                      child: Image.asset(
                        'pictures/intro.jpg',
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(70.0),
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Welcome to GuideMe',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Batam Navigation',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 10), // Space between rows


              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0), // Memberikan jarak vertikal
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'For You',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click, // Change cursor to finger pointer
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to see_all.dart page when "See More" is clicked
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SeeMore(), // Route to the see_all.dart page
                            ),
                          );
                        },
                        child: const Text(
                          'See More',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black, // Text color
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10), // Space between rows

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
            
            const SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: _buildPlaceCard(
                    'Gereja GPIB Jemaat Immanuel', 
                    'Batam Center, Indonesia', 
                    'place_pictures/gpib_immanuel.jpg'
                  )),
                  const SizedBox(width: 10),
                  Expanded(child: _buildPlaceCard(
                    'Taman Kreasi Dino\'s Gate Indonesia', 
                    'Batam Center, Indonesia', 
                    'place_pictures/dino_gate.jpeg'
                  )),
                ],
              ),
              const SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: _buildPlaceCard(
                    'Restoran Ayam Bakar De Peri', 
                    'Batam Center, Indonesia', 
                    'place_pictures/ayam_bakar_de_peri.png'
                  )),
                  const SizedBox(width: 10),
                  Expanded(child: _buildPlaceCard(
                    'Immaculate Conception Mary Church, Pulau Galang', 
                    'Batam Center, Indonesia', 
                    'place_pictures/gereja_pulau_galang.jpeg'
                  )),
                ],
              ),

              const SizedBox(height: 40), // Space between rows
              Center(
                child: Container(
                  width: double.infinity, // Make the container take up full width
                  padding: const EdgeInsets.symmetric(vertical: 16.0), // Adjust vertical padding as needed
                  color: Colors.white, // White background color
                child: const Column(
                    mainAxisSize: MainAxisSize.min, // Keep the column as small as its children
                  children: [
                    Text(
                      'Guide Me',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.black, // Black text for contrast
                    ),
                  ),
                    SizedBox(height: 10), // Spacing between the texts
                    Text(
                      'Made by PBL-IF-12',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.black, // Black text for contrast
                      ),
                    ),
                  ],
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

  // Helper method to build place cards
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