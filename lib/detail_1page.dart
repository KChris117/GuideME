import 'package:flutter/material.dart';

class Detail1Page extends StatelessWidget {
  const Detail1Page({super.key});

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
                'Makam Tumenggung Abdul Jamal',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  'place_pictures/makam_abdul_jamal.jpg', // Same image for detail
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
              
              const SizedBox(height: 8),

              const SizedBox(height: 10),
              // WebView displaying Google Maps with the location
              
              
              const SizedBox(height: 8),

              const Text(
                'Secara arkeologis makam yang dideskripsi adalah makam utama yaitu Makam Temenggung Abdul Jamil. Makam tersebut berbentuk silinder dengan orientasi utaraselatan. Orientasi dan bentuk makam mencirikan makam tersebut makam islam. Nisan makam dibentuk dari batu tuff dengan pola silinder. Nisan tersebut memiliki diameter 26 cm dengan tinggi 84 cm dari tanah penutup kaki nisan. Sementara itu, di luar komplek makam utama terdapat sebuah makam yang sangat indah. Tipe makam tersebut adalah tipe Aceh yang memiliki tanduk dengan ukiran yang sangat halus.', // Add detailed text here
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
