import 'package:flutter/material.dart';

class TicketDetail2Page extends StatelessWidget {
  const TicketDetail2Page({super.key});

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
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Ticket Detail',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                ),
              ),
              const Text(
                'Pantai Melur',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  'tickets/melur.jpg', // Same image for detail
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Makam Temenggung Abdul Jamal adalah sebuah makam bersejarah yang terletak di Pulau Bulang, Kepulauan Riau. Makam ini merupakan makam dari Temenggung Abdul Jamal, seorang pembesar Kerajaan Melayu Johor-Pahang yang pernah memerintah di Batam pada abad ke-18.', // Add detailed text here
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              

            ],
          ),
        ),
      ),
    );
  }
}
