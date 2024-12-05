import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'destinations_view_all.dart';
import 'ticket_detail1.dart';

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
              
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Tickets',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DestinationsViewAll(),
                            ),
                          );
                        },
                        child: const Text(
                          'View All',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('ticket_lists').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text('No Ticket found.'));
                  }

                  final tickets = snapshot.data!.docs;

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(), // Agar daftar scroll sesuai dengan halaman utama
                    itemCount: tickets.length,
                    itemBuilder: (context, index) {
                      final ticket = tickets[index];
                      final ticketId = ticket['ticket_id'] ?? 'N/A';
                      final ticketName = ticket['ticket_name'] ?? 'N/A';
                      final ticketLocation = ticket['ticket_location'] ?? 'N/A';
                      final ticketPicture = ticket['ticket_picture'] ?? '';
                      final ticketRating = double.tryParse(ticket['ticket_rating'].toString()) ?? 0.0;
                      final ticketPrice = ticket['ticket_price'] ?? 'N/A';
                      final ticketDate = ticket['ticket_date'] ?? 'N/A';
                      final ticketTime = ticket['ticket_time'] ?? 'N/A';

                      return buildPlaceCard(
                        ticketName: ticketName,
                        ticketLocation: ticketLocation,
                        ticketPicture: ticketPicture,
                        ticketRating: ticketRating,
                        ticketPrice: ticketPrice,
                        ticketId: ticketId,
                        ticketDate: ticketDate,
                        ticketTime: ticketTime,
                      );
                    },
                  );
                },
              ),

              const SizedBox(height: 40),
              Center(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: const Column(
                    mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Guide Me',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                    ),
                  ),
                    SizedBox(height: 10),
                    Text(
                      'Made by PBL-IF-12',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
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

Widget _buildStarsWithRating(double rating) {
  return Row(
    children: [
      Text(
        rating.toStringAsFixed(1),
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      const SizedBox(width: 4),

      const Icon(Icons.star, color: Colors.black, size: 15),
    ],
  );
}

  // Helper method to build place cards
Widget buildPlaceCard({
  required String ticketName,
  required String ticketLocation,
  required String ticketPicture,
  required String ticketPrice,
  required double ticketRating,
  required String ticketId,
  required String ticketDate,
  required String ticketTime,
  double imagePaddingTop = 20.0,
  double imagePaddingBottom = 20.0,
  double imagePaddingLeft = 20.0,
  double imagePaddingRight = 5.0,
}) {
  return MouseRegion(
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white, // Box color
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
         children: [
          Padding(
            padding: EdgeInsets.only(
              top: imagePaddingTop,
              bottom: imagePaddingBottom,
              left: imagePaddingLeft,
              right: imagePaddingRight, 
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
               ticketPicture,
                width: 160,
                height: 170,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(2.2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ticketName,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 4),

                  _buildStarsWithRating(ticketRating),

                  const SizedBox(height: 4),
                  RichText(
                    text: TextSpan(
                      text: 'Organized by ',
                      style: TextStyle(
                         color: Colors.grey[700],
                        fontSize: 12.0,
                      ),
                      children: [
                        TextSpan(
                          text: 'Batam Tourist',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),
                    
                  Row(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            size: 16,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            ticketDate,
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(width: 10), 

                      Row(
                        children: [
                          const Icon(
                            Icons.location_on, // Location icon
                            size: 16,
                            color: Colors.grey,
                          ),
                          Text(
                            ticketLocation, // Location text
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

                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        ticketTime,
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  Text(
                    'Starts from',
                    style: GoogleFonts.inter(
                      fontSize: 12.0,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Mengatur jarak antar elemen dalam Row
                    children: [
                      Text(
                        ticketPrice,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(right: 10.0), // Add padding here
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click, // Change cursor to pointer on hover
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TicketDetailPage(ticketId: ticketId),
                                  ),
                                );
                              }, // Use the provided onPurchase function
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
  );
}
}