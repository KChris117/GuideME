import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'destinations_view_all2.dart';
import 'destinations_view_all3.dart';
import 'destinations_view_all4.dart';

class DestinationsViewAll extends StatefulWidget {
  const DestinationsViewAll({super.key});

  @override
  State<DestinationsViewAll> createState() => _DestinationsViewAllState();
}

class _DestinationsViewAllState extends State<DestinationsViewAll> {
  
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        title: Row(
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
      ),

      body: SingleChildScrollView(
        child: Container(
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
              Text(
                'Some Destination Recommendations For You',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
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

              StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('destination_lists').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text('No destinations found.'));
                  }

                  final destinations = snapshot.data!.docs;

                  // Menggunakan ListView untuk menampilkan dua card dalam satu row
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: (destinations.length / 2).ceil(), // Membagi jumlah item untuk dua kolom
                    itemBuilder: (context, index) {
                      final firstDestination = destinations[index * 2];
                      final destinationName1 = firstDestination['destination_name'] ?? 'N/A';
                      final destinationLocation1 = firstDestination['destination_location'] ?? 'N/A';
                      final destinationPicture1 = firstDestination['destination_picture'] ?? '';
                      final destinationRating1 = double.tryParse(firstDestination['destination_rating'].toString()) ?? 0.0;
                      final destinationPrice1 = firstDestination['destination_price'] ?? 'N/A';

                      // Cek jika ada item kedua dalam pasangan
                      final secondDestination = index * 2 + 1 < destinations.length ? destinations[index * 2 + 1] : null;
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
                            ),
                          ),
                          
                          const SizedBox(width: 10),
                          
                          if (secondDestination != null) // Menampilkan card kedua jika ada
                            Expanded(
                              child: buildPlaceCard(
                                destinationName: destinationName2,
                                destinationLocation: destinationLocation2,
                                destinationPicture: destinationPicture2,
                                destinationRating: destinationRating2,
                                destinationPrice: destinationPrice2,
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),

              // Add your destinations here for page 2 similar to page 1
              // You can add different places or replicate the structure with different data.

              const SizedBox(height: 40),

              // Pagination Section (reuse the logic from see_more.dart)
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const DestinationsViewAll()), // Navigate to page 1
                          );
                        },
                        child: const Icon(
                          Icons.chevron_left,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),

                    for (int i = 1; i <= 4; i++)
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            if (i == 1) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const DestinationsViewAll()),
                              );
                            } else if (i == 2) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const DestinationsViewAll2()),
                              );
                            } else if (i == 3) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const DestinationsViewAll3()),
                              );
                            } else if (i == 4) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const DestinationsViewAll4()),
                              );
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            decoration: BoxDecoration(
                              color: i == 1 ? Colors.black : Colors.white, // Highlight current page
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(color: Colors.black),
                            ),
                            child: Text(
                              '$i',
                              style: TextStyle(
                                color: i == 1 ? Colors.white : Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),

                    const SizedBox(width: 10),

                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const DestinationsViewAll2()), // Navigate to page 3
                          );
                        },
                        child: const Icon(
                          Icons.chevron_right,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Footer (if needed)
            ],
          ),
        ),
      ),
    );
  }

Widget _buildStarsWithRating(double rating) {
  return Row(
    children: [
      // Display the rating number (e.g., 4.5, 5.0)
      Text(
        rating.toStringAsFixed(1), // Format rating to 1 decimal
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black, // Rating text color
        ),
      ),
      const SizedBox(width: 4), // Add some space between number and the star
      // Display only one black star
      const Icon(Icons.star, color: Colors.black, size: 15),
    ],
  );
}

Widget buildPlaceCard({
  required String destinationName,
  required String destinationLocation,
  required String destinationPicture,
  required String destinationPrice,
  required double destinationRating,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8.0), // Add vertical margin between cards
    padding: const EdgeInsets.all(12.0), // Add padding inside the card
    decoration: BoxDecoration(
      color: Colors.white, // White background for the container
      borderRadius: BorderRadius.circular(15.0), // Rounded corners for the container
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          blurRadius: 8.0,
          offset: const Offset(0, 4), // Position of the shadow
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align column contents to the left
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
        // Align the title text to the left and show stars next to it
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Ensure title wraps nicely without overflowing
            Flexible(
              child: Text(
                destinationName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis, // Add ellipsis if text overflows
                ),
                maxLines: 1, // Limit to one line
              ),
            ),
            const SizedBox(width: 10),
            // Star rating with rating number next to the title
            _buildStarsWithRating(destinationRating),
          ],
        ),
        const SizedBox(height: 8),
        // Add description text below the title and above the stars
        Text(
          destinationLocation,
          textAlign: TextAlign.left, // Align text to the left
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),

        const SizedBox(height: 15),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // MouseRegion for 'Price' with finger pointer cursor
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: Center(
                  child: Text(
                    destinationPrice, // Only price will be clickable
                    style: const TextStyle(
                      color: Colors.grey, // Text color
                      fontSize: 12, // Text size
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