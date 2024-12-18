import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:table_calendar/table_calendar.dart';

class TicketDetailPage extends StatefulWidget {
  final String ticketId;

  const TicketDetailPage({super.key, required this.ticketId});

  @override
  _TicketDetailPageState createState() => _TicketDetailPageState();
}

class _TicketDetailPageState extends State<TicketDetailPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  // Define holidays or big events here
  final Map<String, String> holidays = {
    '01-01': 'New Year\'s Day',
    '02-10': 'Chinese New Year',
    '03-11': 'Hari Raya Nyepi',
    '03-29': 'Good Friday',
    '04-10': 'Eid al-Fitr (Day 1)',
    '04-11': 'Eid al-Fitr (Day 2)',
    '05-01': 'Labour Day',
    '05-09': 'Ascension of Jesus Christ',
    '05-23': 'Waisak',
    '06-06': 'Isra Mi\'raj',
    '06-16': 'Eid al-Adha',
    '07-07': 'Islamic New Year',
    '08-17': 'Independence Day',
    '09-15': 'The Prophet\'s Birthday',
    '12-25': 'Christmas Day',
  };
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Detail Ticket'),
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
                future: FirebaseFirestore.instance
                    .collection('ticket_lists')
                    .doc(widget.ticketId)  // Ganti 'ticketId' dengan 'widget.ticketId'
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  if (!snapshot.hasData || !snapshot.data!.exists) {
                    return Center(child: Text('Tiket tidak ditemukan'));
                  }

                  var ticketData = snapshot.data!.data() as Map<String, dynamic>;

                  return StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('ticket_detail')
                        .where('ticket_id', isEqualTo: widget.ticketId)  // Ganti 'ticketId' dengan 'widget.ticketId'
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
                              'Ticket',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                            const Text(
                              'These Are The Details of The Ticket',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.network(
                                ticketData['ticket_picture'],
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
                                          '${ticketData['ticket_name']}',
                                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.star, color: Colors.black, size: 20),
                                          const SizedBox(width: 4),
                                          Text(
                                            '${ticketData['ticket_rating']}',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '${ticketData['ticket_location']}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '${ticketData['ticket_price']}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  ExpandableDescription(
                                    description1: detailData['ticket_description'] ?? '',
                                    description2: detailData['ticket_description2'] ?? '',
                                    description3: detailData['ticket_description3'] ?? '',
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

              const Text(
                'Event Calendar',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 400, // Adjust the height
                width: 400,  // Adjust the width
                child: Container(
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
                  child: TableCalendar(
                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: _focusedDay,
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    },
                    calendarFormat: _calendarFormat,
                    onFormatChanged: (format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    },
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                    // Menggunakan headerStyle untuk menyembunyikan format button
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false, // Menyembunyikan tombol format
                      titleCentered: true, // Menyusun judul di tengah
                    ),
                    calendarBuilders: CalendarBuilders(
                      defaultBuilder: (context, day, focusedDay) {
                        String dateKey =
                            '${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}';
                        if (holidays.containsKey(dateKey)) {
                          return Tooltip(
                            message: holidays[dateKey],
                            child: Center(
                              child: Text(
                                '${day.day}',
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),
                          );
                        }
                        return null;
                      },
                    ),
                  )
                ),
              ),
              const SizedBox(height: 20),
            ],
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
