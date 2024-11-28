import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Detail2Page extends StatefulWidget {
  const Detail2Page({super.key});

  @override
  Detail2PageState createState() => Detail2PageState();
}

class Detail2PageState extends State<Detail2Page> {
  bool _isExpanded = false;
  final MapController _mapController = MapController(); // Add map controller
  final double _latitude = 1.08333;  // Latitude for location
  final double _longitude = 104.05;  // Longitude for location

  // New map widget function
  Widget displayMap() {
    return FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: LatLng(_latitude, _longitude),
          initialZoom: 15,
          maxZoom: 19,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: const ['a', 'b', 'c'],
            maxZoom: 19,
          ),
          const MarkerLayer(
            markers: [
              Marker(
                point: LatLng(1.08333, 104.05),
                width: 80,
                height: 80,
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Ensures the column takes up as little space as possible
                  children: [
                    Icon(
                      Icons.location_on, // Replace with your logo or preferred icon
                      color: Colors.red,
                      size: 50.0,
                    ),

                    SizedBox(height: 5),
                    // Adds some space between the icon and text
                    Flexible(
                      child: Text(
                        'Miniature House Indonesia', // Your custom text
                        style: TextStyle(
                          color: Colors.black, // Text color
                          fontSize: 12,
                          fontWeight: FontWeight.w900, // Increased text size for better readability
                        ),
                        textAlign: TextAlign.center, // Center align the text
                        overflow: TextOverflow.visible, // Ensures long text is visible without overflow
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(''),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
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
                'Destination',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                ),
              ),
              const Text(
                'These Are The Details of The Destination',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),

              const SizedBox(height: 20),

              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  'assets/place_pictures/miniatur_house.jpeg',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 40),
              // Information Section
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            'Miniature House Indonesia',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                            ),
                            maxLines: 2, // Limit the number of lines to 2
                            overflow: TextOverflow.ellipsis, // Show ellipsis if it overflows
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.black,
                              size: 20,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '4.3',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Bengkong, Batam, Indonesia',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Rp 200.000',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      'Miniature House Indonesia menjadi salah satu destinasi wisata edukasi yang patut dikunjungi di Kota Batam, Kepulauan Riau. Terletak di Golden City Bengkong Laut, Bengkong, taman ini menawarkan pengalaman unik bagi pengunjung untuk menjelajahi miniatur rumah adat dari 26 provinsi di Indonesia, mulai dari Sabang hingga Merauke',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    const SizedBox(height: 8),

                    if (_isExpanded)
                      const Text(
                        'Selain rumah adat, pengunjung juga dapat melihat miniatur tempat ibadah dari berbagai agama yang ada di Indonesia. Setiap miniatur rumah adat dibangun dengan ukuran mini dan dicat dengan warna-warni yang menarik perhatian. Di depan setiap miniatur, terdapat papan informasi yang menyebutkan nama rumah adat dan asal provinsinya, sehingga pengunjung dapat meningkatkan pengetahuan dan memperluas wawasan mereka tentang arsitektur nusantara',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                    const SizedBox(height: 8),

                    if (_isExpanded)
                      const Text(
                        'Taman ini menjadi tempat yang ramai dikunjungi terutama pada akhir pekan. Pengunjung dapat melakukan piknik, berfoto di depan miniatur rumah adat, atau sekadar berjalan-jalan sambil mengamati detail miniatur rumah adat tersebut. Suasana taman yang teduh dan berangin karena dikelilingi banyak pepohonan menambah kenyamanan pengunjung saat berada di Miniature House Indonesia.',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                    const SizedBox(height: 8),

                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              _isExpanded ? 'Show Less' : 'Read More',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                              ),
                            ),

                            const SizedBox(width: 5),

                            Icon(
                              _isExpanded
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // New Map Section
              SizedBox(
                height: 250, // Height for the map
                child: displayMap(),
              ),

              const SizedBox(height: 40),

              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 300, // Set a fixed width for the box
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.cloud,
                            color: Colors.black,
                            size: 30,
                          ),

                          SizedBox(width: 10),

                          Text(
                            '31 Celcius',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 8),

                      Text(
                        'Note',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),

                      SizedBox(height: 10),

                      Text(
                        'Lorem ipsum odor amet, consectetuer adipiscing elit. Efficitur tortor lacus etiam metus ullamcorper.',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),



                      Text(
                        'Lorem ipsum odor amet, consectetuer adipiscing elit. Efficitur tortor lacus etiam metus ullamcorper.',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 300, // Set a fixed width for the box
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),

                  padding: const EdgeInsets.all(16.0),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: Colors.black,
                            size: 30,
                          ),

                          SizedBox(width: 10),

                          Text(
                            'Event and Activity',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10),

                      Text(
                        'Lorem ipsum odor amet, consectetuer adipiscing elit. Efficitur tortor lacus etiam metus ullamcorper.',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      Text(
                        'Lorem ipsum odor amet, consectetuer adipiscing elit. Efficitur tortor lacus etiam metus ullamcorper.',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 300, // Set a fixed width for the box
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.my_library_books,
                            color: Colors.black,
                            size: 30,
                          ),

                          SizedBox(width: 10),

                          Text(
                            'Ticket',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10),

                      Text(
                        'Lorem ipsum odor amet, consectetuer adipiscing elit. Efficitur tortor lacus etiam metus ullamcorper.',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      Text(
                        'Lorem ipsum odor amet, consectetuer adipiscing elit. Efficitur tortor lacus etiam metus ullamcorper.',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
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
    );
  }
}
