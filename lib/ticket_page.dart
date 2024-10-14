import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
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

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0), // Memberikan jarak vertikal
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tickets',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            
              Column(
                children: [
                  _buildNavigationBox(
                    'Pantai Raviola',
                    'Organized by Batam Tourist',
                    'tickets/raviola.jpeg',
                    '4.4',
                    'Unlimited',
                    'Galang Baru, Kota Batam, Indonesia',
                    '24 Jam',
                    'Starts from',
                    'Rp 20.000',
                    onPurchase: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TicketDetail1Page()),
                      );
                    },
                  ),
                  const SizedBox(height: 20), // Space between boxes
                  _buildNavigationBox(
                    'Pantai Melur',
                    'Organized by Batam Tourista',
                    'tickets/melur.jpg',
                    '4.5',
                    'Unlimited',
                    'Galang Baru, Kota Batam, Indonesia',
                    '24 Jam',
                    'Starts from',
                    'Rp 10.000',
                    onPurchase: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TicketDetail2Page()),
                      );
                    },
                  ),
                  const SizedBox(height: 20), // Space between boxes
                  _buildNavigationBox(
                    'Ocarina',
                    'Organized by Batam Tourist',
                    'tickets/ocarina.jpg',
                    '4.2',
                    'Unlimited',
                    'Bengkong, Kota Batam, Indonesia',
                    '08.00 am - 22.00 pm',
                    'Starts from',
                    'Rp 50.000',
                    onPurchase: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TicketDetail3Page()),
                      );
                    },
                  ),
                  const SizedBox(height: 20), // Space between boxes
                  _buildNavigationBox(
                    'Camp Vietnam',
                    'Organized by Batam Tourist',
                    'tickets/camp_vietnam.jpg',
                    '4.3',
                    'Unlimited',
                    'Galang Baru, Kota Batam, Indonesia',
                    '07.30 am - 20.00 pm',
                    'Starts from',
                    'Rp 70.000',
                    onPurchase: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TicketDetail4Page()),
                      );
                    },
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

  Widget _buildNavigationBox(
    String title, 
    String organized, 
    String imagePath, 
    String rating, 
    String calendar, 
    String location, 
    String time, 
    String startsfrom, 
    String prize,
    {
    required VoidCallback onPurchase,
    double imagePaddingTop = 20.0, 
    double imagePaddingBottom = 20.0, 
    double imagePaddingLeft = 20.0, 
    double imagePaddingRight = 5.0
    }) {
  return MouseRegion(
    cursor: SystemMouseCursors.click, // Change cursor to finger on hover
    child: GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Box color
          borderRadius: BorderRadius.circular(15.0), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 1, // Spread radius of the shadow
              blurRadius: 5, // Blur radius of the shadow
              offset: const Offset(0, 3), // Offset of the shadow
            ),
          ],
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
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  imagePath,
                  width: 160, // Set width of the image
                  height: 170, // Set height of the image
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
                    Row(
                      children: [
                        const Icon(
                          Icons.star, // Black star icon
                          color: Colors.black,
                          size: 16, // Adjust the size of the star
                        ),
                        Text(
                          rating, // Display the rating value
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Organized by ', // Regular part
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                          TextSpan(
                            text: organized.split('by ').last, // Bold part
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.bold, // Bold font for organizer
                              color: Colors.black, // You can adjust the color as needed
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    // Row for calendar icon and text
                    Row(
                      children: [
                        // Calendar icon and text
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today, // Calendar icon
                              size: 16,
                              color: Colors.grey,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              calendar, // Calendar text
                              style: GoogleFonts.inter(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10), // Space between calendar and location
                        // Location icon and text
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on, // Location icon
                              size: 16,
                              color: Colors.grey,
                            ),
                            Text(
                              location, // Location text
                              style: GoogleFonts.inter(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    // Row for clock icon and text
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time, // Clock icon
                          size: 16,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          time, // Time text
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      startsfrom,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start, // Space between the text and button
                      children: [
                        Text(
                          prize,
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 90), // Spacing between the text and button
                        // Purchase Button
                        MouseRegion(
                          cursor: SystemMouseCursors.click, // Change cursor to pointer on hover
                          child: GestureDetector(
                            onTap: onPurchase, // Use the provided onPurchase function
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0), // Padding inside the button
                              decoration: BoxDecoration(
                                color: Colors.black, // Button background color
                                borderRadius: BorderRadius.circular(10.0), // Rounded corners
                              ),
                              child: const Text(
                                'Purchase',
                                style: TextStyle(
                                  color: Colors.white, // Text color
                                  fontSize: 14, // Text size
                                  fontWeight: FontWeight.bold, // Text weight
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}