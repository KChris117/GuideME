import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Event2Page extends StatefulWidget {
  const Event2Page({super.key});

  @override
  Event2PageState  createState() => Event2PageState ();
}

class Event2PageState  extends State<Event2Page> {
  bool _isExpanded = false;
  final MapController _mapController = MapController(); // Add map controller
  final double _latitude = 1.1273893;  // Latitude for location
  final double _longitude = 104.056352;  // Longitude for location

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
                point: LatLng(1.1273893, 104.056352),
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
                        'Engku Putri', // Your custom text
                        style: TextStyle(
                          color: Colors.black, // Text color
                          fontSize: 12, // Increased text size for better readability
                          fontWeight: FontWeight.w900,
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
                'These Are The Details of The Event',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),

              const SizedBox(height: 20),

              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  'assets/event/batam10k.jpeg',
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
                            'Batam RUN 10K Engku Putri',
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
                              '4.0',
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
                      'Batam Center, Batam, Indonesia',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Rp 150.000',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      'Pemerintah Kota (Pemko) Batam melalui Dinas Kebudayaan dan Pariwisata (Disbudpar) Kota Batam kembali menggelar olahraga lari bertajuk, Batam 10K. ”Pendaftaran sudah dibuka sejak 20 Mei 2024. Acara akan digelar pada 14 Juli 2024,” kata Kepala Disbudpar Batam, Ardiwinata, Rabu.',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    const SizedBox(height: 8),

                    if (_isExpanded)
                      const Text(
                        'Untuk biaya pendaftar, hanya Rp150.000 bagi kategori Umum, Master, dan Pelajar. Event yang dinanti bagi para pelari Kota Batam ini akan menempuh rute Hotel Santika menuju Harmoni One. Kemudian, ke arah Simpang Rosdale menuju Simpang Orcard kembali lagi ke Hotel Santika melalui Simpang Bank Indonesia (BI).',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      const SizedBox(height: 8),

                      if (_isExpanded)
                      const Text(
                        '”Lokasi acara dipusatkan di Depan Hotel Santika Batam. Total Hadiah sebesar Rp31 juta, dan hadiah hiburan berupa umrah, sepeda motor, TV, setrika, dispenser, magic com, handphone dan sebagainya,” katanya. Ardiwinata mengaku, event ini merupakan event tahunan yang menjadi sport tourism. Ia berharap, terdapat peserta dari luar daerah hingga luar negeri.',
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
