import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class DestinationDetailPage extends StatelessWidget {
  final String destinationId;

  const DestinationDetailPage({super.key, required this.destinationId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Detail Destinasi'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance.collection('destination_lists').doc(destinationId).get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  if (!snapshot.hasData || !snapshot.data!.exists) {
                    return Center(child: Text('Destinasi tidak ditemukan'));
                  }

                  var destinationData = snapshot.data!.data() as Map<String, dynamic>;

                  return StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('destination_detail')
                        .where('destination_id', isEqualTo: destinationId)
                        .snapshots(),
                    builder: (context, detailSnapshot) {
                      if (detailSnapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (!detailSnapshot.hasData || detailSnapshot.data!.docs.isEmpty) {
                        return const Center(child: Text('Detail tidak ditemukan.'));
                      }

                      final detailDoc = detailSnapshot.data!.docs.first;
                      final detailData = detailDoc.data() as Map<String, dynamic>;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                            const SizedBox(height: 16),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.network(
                                destinationData['destination_picture'],
                                width: double.infinity,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 6,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '${destinationData['destination_name']}',
                                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.star, color: Colors.black, size: 20),
                                          const SizedBox(width: 4),
                                          Text(
                                            '${destinationData['destination_rating']}',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '${destinationData['destination_location']}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '${destinationData['destination_price']}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  ExpandableDescription(
                                    description1: detailData['destination_description'] ?? '',
                                    description2: detailData['destination_description2'] ?? '',
                                    description3: detailData['destination_description3'] ?? '',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),

              const SizedBox(height: 16),

              // Data tambahan untuk latitude dan longitude dengan peta
              StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance.collection('destination_lists').doc(destinationId).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.exists == false) {
                    return const Center(child: Text('Destinasi tidak ditemukan.'));
                  }

                  var destinationData = snapshot.data!.data() as Map<String, dynamic>;
                  String destinationName = destinationData['destination_name'] ?? 'Unknown Destination';

                  return StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('destination_detail')
                        .where('destination_id', isEqualTo: destinationId)
                        .snapshots(),
                    builder: (context, detailSnapshot) {
                      if (detailSnapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (!detailSnapshot.hasData || detailSnapshot.data!.docs.isEmpty) {
                        return const Center(child: Text(''));
                      }

                      final detailDoc = detailSnapshot.data!.docs.first;
                      final detailData = detailDoc.data() as Map<String, dynamic>;

                      final destinationLatitude = detailData['destination_latitude'] as GeoPoint?;
                      final destinationLongitude = detailData['destination_latitude'] as GeoPoint?;

                      if (destinationLatitude != null && destinationLongitude != null) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 200,
                              child: FlutterMap(
                                options: MapOptions(
                                  initialCenter: LatLng(destinationLatitude.latitude, destinationLongitude.longitude),
                                  initialZoom: 13.0,
                                ),
                                children: [
                                  TileLayer(
                                    urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                                    subdomains: ['a', 'b', 'c'],
                                  ),
                                  MarkerLayer(
                                    markers: [
                                      Marker(
                                        point: LatLng(destinationLatitude.latitude, destinationLongitude.longitude),
                                        width: 80,
                                        height: 80,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              color: Colors.red,
                                              size: 50.0,
                                            ),
                                            SizedBox(height: 5),
                                            Flexible(
                                              child: Text(
                                                destinationName, // Ganti dengan destination_name yang didapat dari snapshot
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
                                ],
                              ),
                            ),
                          ],
                        );
                      }
                      return SizedBox.shrink();
                    },
                  );
                },
              ),
            ]
          ),
        ),
      ),
    );
  }
}

class ExpandableDescription extends StatefulWidget {
  final String description1;
  final String description2;
  final String description3;

  const ExpandableDescription({
    Key? key,
    required this.description1,
    required this.description2,
    required this.description3,
  }) : super(key: key);

  @override
  _ExpandableDescriptionState createState() => _ExpandableDescriptionState();
}

class _ExpandableDescriptionState extends State<ExpandableDescription> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description1,
          style: const TextStyle(fontSize: 14),
        ),
        if (_isExpanded) ...[
          const SizedBox(height: 8),
          Text(
            widget.description2,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 8),
          Text(
            widget.description3,
            style: const TextStyle(fontSize: 14),
          ),
        ],
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Text(
            _isExpanded ? 'Show Less' : 'Read More',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
