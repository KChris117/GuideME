// detail_1page.dart
import 'package:flutter/material.dart';

class Detail2Page extends StatelessWidget {
  const Detail2Page({super.key});

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
                'Destination',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                ),
              ),
              const Text(
                'Miniature House Indonesia',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  'place_pictures/miniatur_house.jpeg', // Same image for detail
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Miniatur House Indonesia adalah sebuah museum yang terletak di Batam, Indonesia. Museum ini menampilkan berbagai macam miniatur rumah tradisional dari berbagai daerah di Indonesia.Miniatur House Indonesia adalah tempat yang ideal untuk belajar tentang budaya Indonesia. Museum ini memiliki suasana yang menyenangkan dan edukatif, serta staf yang ramah dan informatif.', // Add detailed text here
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
