import 'package:flutter/material.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  int _selectedIndex = 3; // Gallery tab

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

  // Function to show the image in a full-screen modal
  void _showImageModal(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context); // Close the modal when tapped
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.black,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  imagePath, // Load full-size image
                  fit: BoxFit.contain, // Ensure the image is properly scaled
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const List<String> imagePaths = [
      'assets/place_pictures/makam_abdul_jamal.jpg',
      'assets/place_pictures/gpib_immanuel.jpg',
      'assets/tickets/camp_vietnam.jpg',
      'assets/place_pictures/makam_abdul_jamal/foto4.jpg',
      'assets/tickets/ocarina.jpg',
      'assets/place_pictures/makam_abdul_jamal/foto2.jpg',
      'assets/tickets/raviola.jpeg',
      'assets/place_pictures/ayam_bakar_de_peri.png',
      'assets/place_pictures/dino_gate.jpeg',
    ];

    const double imageHeight = 100.0; // Adjust height as needed

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Gallery'),
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

              const SizedBox(height: 10),
              // Filter Box
              SingleChildScrollView(
                scrollDirection: Axis.horizontal, // Enable horizontal scrolling
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Filter Button
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to the filter page here
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => FilterPage()));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: Colors.black, width: 1),
                          ),
                          child: const Icon(Icons.filter_list, color: Colors.white, size: 20),
                        ),
                      ),
                    ),
                    
                    const SizedBox(width: 10),

                    // Beach Button
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          // Define the action for the Beach button here
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: Colors.black, width: 1),
                          ),
                          child: const Text(
                            'Beach',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    // Natural Attractions Button
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          // Define the action for the Natural Attractions button here
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: Colors.black, width: 1),
                          ),
                          child: const Text(
                            'Natural Attractions',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    // Historical Sites Button
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          // Define the action for the Historical Sites button here
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: Colors.black, width: 1),
                          ),
                          child: const Text(
                            'Historical Sites',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 20),

            Row(
              children: [
                const SizedBox(width: 1),
                Expanded(
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: TextField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search, size: 20),
                        prefixIconConstraints: BoxConstraints(minHeight: 25, minWidth: 50),
                        contentPadding: EdgeInsets.only(left: 20, right: 20),
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

              const SizedBox(height: 20),

              GridView.builder(
                physics: const NeverScrollableScrollPhysics(), // Disable scrolling in GridView
                shrinkWrap: true, // Make GridView take only the required space
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 images in each row
                  childAspectRatio: 1, // Adjust aspect ratio for square images
                ),
                itemCount: imagePaths.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // Show modal with full image when tapped
                      _showImageModal(context, imagePaths[index]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0), // Padding between images
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          imagePaths[index], // Load image from the path
                          fit: BoxFit.cover,
                          height: imageHeight, // Set the height of each image
                        ),
                      ),
                    ),
                  );
                },
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
}
