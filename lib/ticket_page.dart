import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'detail_1page.dart';
import 'detail_2page.dart';
import 'transaction_detail_1page.dart';
import 'transaction_detail_2page.dart';
import 'ticket_detail.dart';
import 'ticket_detail2.dart';
import 'ticket_detail3.dart';
import 'ticket_detail4.dart';


class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  int _selectedIndex = 1; // Gallery tab

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
        title: const Text('Ticket'),
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
              title: const Text('Event'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/event');
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start, // Align the buttons to the start (left)
                children: [
                  // Existing Filter Button
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to the filter page here
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => FilterPage()));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10), // Margin for spacing
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        child: const Icon(Icons.filter_list, color: Colors.white, size: 20), // Centered filter icon
                      ),
                    ),
                  ),

                  // SizedBox to add custom spacing between the buttons
                  const SizedBox(width: 10), // Adjust the width as per your requirement

                  // New Box Button (Right side of the Filter button)
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        // Define the action for the new button here
                        // For example: Navigator.push(context, MaterialPageRoute(builder: (context) => NewPage()));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10), // Margin for spacing
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                       child: const Text(
                        'Beach', // The text inside the button
                        style: TextStyle(
                          color: Colors.black, // Text color
                          fontSize: 14, // Text size
                          fontWeight: FontWeight.bold, // Text weight
                        ),
                      ),
                    ),
                  ),
                ),

                // SizedBox to add custom spacing between the buttons
                  const SizedBox(width: 10), // Adjust the width as per your requirement

                  // New Box Button (Right side of the Filter button)
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        // Define the action for the new button here
                        // For example: Navigator.push(context, MaterialPageRoute(builder: (context) => NewPage()));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10), // Margin for spacing
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                       child: const Text(
                        'Natural Actractions', // The text inside the button
                        style: TextStyle(
                          color: Colors.black, // Text color
                          fontSize: 14, // Text size
                          fontWeight: FontWeight.bold, // Text weight
                        ),
                      ),
                    ),
                  ),
                ),

                // SizedBox to add custom spacing between the buttons
                  const SizedBox(width: 10), // Adjust the width as per your requirement

                  // New Box Button (Right side of the Filter button)
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        // Define the action for the new button here
                        // For example: Navigator.push(context, MaterialPageRoute(builder: (context) => NewPage()));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10), // Margin for spacing
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                       child: const Text(
                        'Historical Sites', // The text inside the button
                        style: TextStyle(
                          color: Colors.black, // Text color
                          fontSize: 14, // Text size
                          fontWeight: FontWeight.bold, // Text weight
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0), // Memberikan jarak vertikal
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ticket',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                          // Arahkan ke halaman lain saat "View All" ditekan
                          Navigator.pushReplacementNamed(context, '/yourPageRoute');
                        },
                        child: const Text(
                          'View All',
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
              
              const SizedBox(height: 40),

              _buildFamilyBundleBox(
              checkIcon: Icons.check_circle, // Use the built-in icon
              bundleText: 'Family Bundle',
              ticketCount: '4 tickets',
              description: 'For every beach',
              price: 'Rp 70.000',
            ),
            
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _buildNavigationBox(
                      'Pantai Raviola',
                      'Galang baru, Batam, Indonesia',
                      'Rp 20.000',
                      'tickets/raviola.jpeg', // Ensure this image exists
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const TicketDetail1Page()),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 10), // Space between boxes
                  Expanded(
                    child: _buildNavigationBox(
                      'Pantai Melur',
                      'Galang baru, Batam, Indonesia',
                      'Rp 10.000',
                      'tickets/melur.jpg', // Ensure this image exists
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const TicketDetail2Page()),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20), // Space between rows
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _buildNavigationBox(
                      'Ocarina',
                      'Bengkong, Batam, Indonesia',
                      'Rp 50.000',
                      'tickets/ocarina.jpg', // Ensure this image exists
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const TicketDetail3Page()),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 10), // Space between boxes
                  Expanded(
                    child: _buildNavigationBox(
                      'Camp Vietnam',
                      'Galang baru, Batam, Indonesia',
                      'Rp 70.000',
                      'tickets/camp_vietnam.jpg', // Ensure this image exists
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const TicketDetail4Page()),
                        );
                      },
                    ),
                  ),
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
            label: 'Event',
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

  Widget _buildNavigationBox(String title, String description, String prize, String imagePath, VoidCallback onTap, 
    {
    double imagePaddingTop = 20.0, 
    double imagePaddingBottom = 20.0, 
    double imagePaddingLeft = 20.0, 
    double imagePaddingRight = 5.0
    }) {
  return MouseRegion(
    cursor: SystemMouseCursors.click, // Change cursor to finger on hover
  child: GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white, // Box color
        border: Border.all(color: Colors.black), // Black stroke
        borderRadius: BorderRadius.circular(15.0), // Rounded corners
      ),
      child: Row(
        children: [
          // Image on the left with adjustable padding
          Padding(
            padding: EdgeInsets.only(
              top: imagePaddingTop,
              bottom: imagePaddingBottom,
              left: imagePaddingLeft,
              right: imagePaddingRight, // Right padding for spacing from text
            ),
            child: ClipRRect(
              child: Image.asset(
                imagePath,
                width: 58, // Set width of the image
                height: 60, // Set height of the image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Text on the right
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(2.2), // Padding for the text
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
              children: [

                  Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              Text(
                description,
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),

              Text(
                prize,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),

            ]
          ),

            ),
          ),
        ],
      ),
    ),
  ),
);
}

Widget _buildFamilyBundleBox({
  required IconData checkIcon, // Icon for the check logo  required String bundleText, // Text in the middle (e.g., "Family Bundle")
  required String bundleText, // Text in the middle (e.g., "Family Bundle")
  required String ticketCount, // Text inside the rounded box (e.g., "4 tickets")
  required String description, // Description below the rounded box (e.g., "For every beach")
  required String price, // Price text on the right side (e.g., "Rp 70.000")
  double iconSize = 40.0, // Adjustable size for the check icon
  double bundleTextSize = 16.0, // Adjustable font size for "Family Bundle"
  double ticketTextSize = 12.0, // Adjustable font size for "4 tickets"
  double descriptionTextSize = 10.0, // Adjustable font size for the description
  double priceTextSize = 14.0, // Adjustable font size for the price
}) {
  return Container(
    padding: const EdgeInsets.all(20.0),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.black), // Black stroke
      borderRadius: BorderRadius.circular(15.0), // Rounded corners
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Check Icon on the left
          Padding(
            padding: const EdgeInsets.only(right: 10.0), // Spacing between icon and text
            child: Icon(
              checkIcon, // Use the passed check icon
              size: iconSize, // Adjustable size for the check icon
              color: Colors.black, // Icon color
            ),
          ),
        
        // Middle: Family Bundle text, 4 tickets box, and description
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bundleText,
                style: TextStyle(
                  fontSize: bundleTextSize, // Adjustable "Family Bundle" size
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              // Rounded box containing the ticket count
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20.0), // Rounded box
                ),
                child: Text(
                  ticketCount,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ticketTextSize, // Adjustable "4 tickets" text size
                  ),
                ),
              ),
              const SizedBox(height: 4),
              // "For every beach" description
              Text(
                description,
                style: TextStyle(
                  fontSize: descriptionTextSize, // Adjustable description text size
                  color: Colors.grey, // Grey color for the text
                ),
              ),
              
            ],
          ),
        ),

        // Right: Price
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text(
            price,
            style: TextStyle(
              fontSize: priceTextSize, // Adjustable price text size
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
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
                } else if (title == 'Miniature House Indonesia') {
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