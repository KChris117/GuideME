import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'transaction_detail_1page.dart';
import 'transaction_detail_2page.dart';
import 'event_view_all2.dart';
import 'event_view_all3.dart';
import 'event_view_all4.dart';
import 'event_detail1.dart';
import 'event_detail2.dart';

class EventViewAll extends StatefulWidget {
  const EventViewAll({super.key});

  @override
  State<EventViewAll> createState() => _EventViewAllState();
}

class _EventViewAllState extends State<EventViewAll> {
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
                'Some Event Recommendations For You',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
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
                        'Natural Atractions', // The text inside the button
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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: _buildPlaceCard(
                    'Batam RUN, Neo Ocarina', 
                    'Bengkong, Indonesia', 
                    'event/batamrun.jpg'
                  )),
                  const SizedBox(width: 10),
                  Expanded(child: _buildPlaceCard(
                    'Batam 10K. Engku Putri', 
                    'Batam Center, Indonesia', 
                    'event/batam10k.jpeg'
                  )),
                ],
              ),        
            
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: _buildPlaceCard(
                    'Batam RUN, Neo Ocarina', 
                    'Bengkong, Indonesia', 
                    'event/batamrun.jpg'
                  )),
                  const SizedBox(width: 10),
                  Expanded(child: _buildPlaceCard(
                    'Batam 10K. Engku Putri', 
                    'Batam Center, Indonesia', 
                    'event/batam10k.jpeg'
                  )),
                ],
              ),        
            
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
                            MaterialPageRoute(builder: (context) => const EventViewAll()), // Navigate to page 1
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
                                MaterialPageRoute(builder: (context) => const EventViewAll()),
                              );
                            } else if (i == 2) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const EventViewAll2()),
                              );
                            } else if (i == 3) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const EventViewAll3()),
                              );
                            } else if (i == 4) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const EventViewAll4()),
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
                            MaterialPageRoute(builder: (context) => const EventViewAll2()), // Navigate to page 3
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
                if (title == 'Batam RUN, Neo Ocarina') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Event1Page()),
                  );
                } else if (title == 'Batam 10K. Engku Putri') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Event2Page()),
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