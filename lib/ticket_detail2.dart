import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TicketDetail2Page extends StatefulWidget {
  const TicketDetail2Page({super.key});

  @override
  TicketDetail2PageState createState() => TicketDetail2PageState();
}

class TicketDetail2PageState extends State<TicketDetail2Page> {
  bool _isExpanded = false;
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

              const SizedBox(height: 20),

              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  'assets/tickets/melur.jpg',
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
                            'Pantai Melur',
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
                              '4.5',
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
                      'Galang Baru, Batam, Indonesia',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Rp 25.000',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      'Pantai Glory Melur salah satu pilihan yang banyak dikunjungi wisatawan saat berlibur di Kota Batam, baik Wisatawan lokal maupun mancanegara. Pantai ini terdapat di Pulau Galang, setelah jembatan lima Barelang, Kota Batam. Dari Batam Center setidaknya butuh waktu satu setengah jam menggunakan kendaraan roda empat.',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    const SizedBox(height: 8),

                    if (_isExpanded)
                      const Text(
                        'Pantai Glory Melur memiliki pasir yang putih dan juga bersih. Sepanjang pantai banyak tedapat gazebo berbagai ukuran yang disewakan, mulai dari ukuran S, L, M dan XL. Satu gazebo kecil disewakan Rp150 ribu, hingga yang besar Rp300 ribu. Di pantai ini juga disewakan tenda, dan aula.',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                    const SizedBox(height: 8),

                    if (_isExpanded)
                      const Text(
                        'Suhu udara Pantai Glory Melur ini cukup panas, apalagi siang hari. Pengunjung memang disarankan menyewa gazebo yang tersedia. "Apalagi tidak ada pohon-pohon di pantai ini, mendingan pakai gazebo," kata Dilla salah seorang pengunjung kepada Tempo.co belum lama ini',
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
                            Icons.double_arrow,
                            color: Colors.black,
                            size: 30,
                          ),

                          SizedBox(width: 10),

                          Text(
                            'Routes',
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

              const SizedBox(height: 20),
              // Calendar Section with Custom Size
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
                width: double.infinity,  // Adjust the width
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
                    // Highlight specific days (holidays) in red
                    calendarBuilders: CalendarBuilders(
                      defaultBuilder: (context, day, focusedDay) {
                        String dateKey =
                            '${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}';
                        // Check if the day is a holiday
                        if (holidays.containsKey(dateKey)) {
                          return Tooltip(
                            message: holidays[dateKey], // Get the description from the map
                            child: Center(
                              child: Text(
                                '${day.day}',
                                style: const TextStyle(color: Colors.red), // Red color for holidays
                              ),
                            ),
                          );
                        }
                        return null; // Return null for non-holiday days to keep default appearance
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              // Note Section
              SizedBox(
                height: 130, // Adjust the height
                width: 150,  // Adjust the width
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
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Note',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start, // Align the items to the left
                        children: [
                          Container(
                            width: 20, // Fixed width for the rectangular note
                            height: 20,
                            color: Colors.red,
                            alignment: Alignment.center,
                          ),

                          const SizedBox(width: 10),

                          const Text(
                            'Holiday',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16, // Change this size as needed
                            ),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start, // Align the items to the left
                        children: [
                          Container(
                            width: 20,
                            height: 30,
                            decoration: const BoxDecoration(
                              color: Colors.blueAccent,
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                          ),

                          const SizedBox(width: 10),

                          const Text(
                            'Today',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16, // Change this size as needed
                            ),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),

                    ],
                  ),
                ),
              ),

              const SizedBox(height: 50,)
              // Additional sections for notes, events, tickets, etc.
            ],
          ),
        ),
      ),
    );
  }
}
