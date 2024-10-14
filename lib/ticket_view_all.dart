import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ticket_view_all2.dart'; // Import the other pagination pages
import 'ticket_view_all3.dart';
import 'ticket_view_all4.dart';
import 'ticket_detail.dart';
import 'ticket_detail2.dart';
import 'ticket_detail3.dart';
import 'ticket_detail4.dart';

class TicketViewAll extends StatefulWidget {
  const TicketViewAll({super.key});

  @override
  State<TicketViewAll> createState() => _TicketViewAllState();
}

class _TicketViewAllState extends State<TicketViewAll> {
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
                'Some Ticket Recommendations For You',
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
                            MaterialPageRoute(builder: (context) => const TicketViewAll()), // Navigate to page 1
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
                                MaterialPageRoute(builder: (context) => const TicketViewAll()),
                              );
                            } else if (i == 2) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const TicketViewAll2()),
                              );
                            } else if (i == 3) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const TicketViewAll3()),
                              );
                            } else if (i == 4) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const TicketViewAll4()),
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
                            MaterialPageRoute(builder: (context) => const TicketViewAll2()), // Navigate to page 3
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

}
