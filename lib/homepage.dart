import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'destination_detail.dart';
import 'destinations_view_all.dart';
import 'event_view_all.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

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
                          Colors.grey.withOpacity(1),
                          BlendMode.multiply,
                          ),
                      child: Image.asset(
                        'assets/pictures/intro.jpg',
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
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Destinations',
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
                stream: FirebaseFirestore.instance
                  .collection('destination_lists')
                  .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text('No destinations found.'));
                  }

                  final destinations = snapshot.data!.docs;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: (destinations.length / 2).ceil(),
                    itemBuilder: (context, index) {
                      final firstDestination = destinations[index * 2];
                      final destinationId1 = firstDestination['destination_id'] ?? 'N/A';
                      final destinationName1 = firstDestination['destination_name'] ?? 'N/A';
                      final destinationLocation1 = firstDestination['destination_location'] ?? 'N/A';
                      final destinationPicture1 = firstDestination['destination_picture'] ?? '';
                      final destinationRating1 = double.tryParse(firstDestination['destination_rating'].toString()) ?? 0.0;
                      final destinationPrice1 = firstDestination['destination_price'] ?? 'N/A';

                      // Cek jika ada item kedua dalam pasangan
                      final secondDestination = index * 2 + 1 < destinations.length ? destinations[index * 2 + 1] : null;
                      final destinationId2 = secondDestination?['destination_id'] ?? 'N/A';
                      final destinationName2 = secondDestination?['destination_name'] ?? 'N/A';
                      final destinationLocation2 = secondDestination?['destination_location'] ?? 'N/A';
                      final destinationPicture2 = secondDestination?['destination_picture'] ?? '';
                      final destinationRating2 = secondDestination != null
                          ? double.tryParse(secondDestination['destination_rating'].toString()) ?? 0.0
                          : 0.0;
                      final destinationPrice2 = secondDestination?['destination_price'] ?? 'N/A';

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: buildPlaceCard(
                              destinationName: destinationName1,
                              destinationLocation: destinationLocation1,
                              destinationPicture: destinationPicture1,
                              destinationRating: destinationRating1,
                              destinationPrice: destinationPrice1,
                              destinationId: destinationId1,
                            ),
                          ),
                          
                          const SizedBox(width: 10),
                          
                          if (secondDestination != null)
                            Expanded(
                              child: buildPlaceCard(
                                destinationName: destinationName2,
                                destinationLocation: destinationLocation2,
                                destinationPicture: destinationPicture2,
                                destinationRating: destinationRating2,
                                destinationPrice: destinationPrice2,
                                destinationId: destinationId2,
                                
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),

              const SizedBox(height: 40),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Event',
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
                              builder: (context) => const EventViewAll(),
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
                stream: FirebaseFirestore.instance
                  .collection('event_lists')
                  .limit(2)
                  .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text('No Event found.'));
                  }

                  final destinations = snapshot.data!.docs;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: (destinations.length / 2).ceil(),
                    itemBuilder: (context, index) {
                      final firstEvent = destinations[index * 2];
                      final eventName1 = firstEvent['event_name'] ?? 'N/A';
                      final eventLocation1 = firstEvent['event_location'] ?? 'N/A';
                      final eventPicture1 = firstEvent['event_picture'] ?? '';
                      final eventRating1 = double.tryParse(firstEvent['event_rating'].toString()) ?? 0.0;
                      final eventPrice1 = firstEvent['event_price'] ?? 'N/A';

                      // Cek jika ada item kedua dalam pasangan
                      final secondEvent = index * 2 + 1 < destinations.length ? destinations[index * 2 + 1] : null;
                      final eventName2 = secondEvent?['event_name'] ?? 'N/A';
                      final eventLocation2 = secondEvent?['event_location'] ?? 'N/A';
                      final eventPicture2 = secondEvent?['event_picture'] ?? '';
                      final eventRating2 = secondEvent != null
                          ? double.tryParse(secondEvent['event_rating'].toString()) ?? 0.0
                          : 0.0;
                      final eventPrice2 = secondEvent?['event_price'] ?? 'N/A';

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: buildEventCard(
                              eventName: eventName1,
                              eventLocation: eventLocation1,
                              eventPicture: eventPicture1,
                              eventRating: eventRating1,
                              eventPrice: eventPrice1,
                            ),
                          ),
                          const SizedBox(width: 10),
                          if (secondEvent != null)
                            Expanded(
                              child: buildEventCard(
                                eventName: eventName2,
                                eventLocation: eventLocation2,
                                eventPicture: eventPicture2,
                                eventRating: eventRating2,
                                eventPrice: eventPrice2,
                              ),
                            ),
                          ],
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
  required String destinationName,
  required String destinationLocation,
  required String destinationPicture,
  required String destinationPrice,
  required double destinationRating,
  required String destinationId,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8.0),
    padding: const EdgeInsets.all(12.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          blurRadius: 8.0,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            destinationPicture,
            width: double.infinity,
            height: 150,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                destinationName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 1,
              ),
            ),
            const SizedBox(width: 10),
            _buildStarsWithRating(destinationRating),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          destinationLocation,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: Center(
                  child: Text(
                    destinationPrice, 
                    style: const TextStyle(
                      color: Colors.grey, 
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DestinationDetailPage(destinationId: destinationId),
                ),
              );
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
    ),
  );
}

Widget buildEventCard({
  required String eventName,
  required String eventLocation,
  required String eventPicture,
  required String eventPrice,
  required double eventRating,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8.0),
    padding: const EdgeInsets.all(12.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          blurRadius: 8.0,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            eventPicture,
            width: double.infinity,
            height: 150,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                eventName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 1,
              ),
            ),
            const SizedBox(width: 10),

            _buildStarsWithRating(eventRating),
          ],
        ),
        const SizedBox(height: 8),

        Text(
          eventLocation,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),

        const SizedBox(height: 15),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: Center(
                  child: Text(
                    eventPrice,
                    style: const TextStyle(
                      color: Colors.grey, 
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),

            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
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
    ),
  );
}
}