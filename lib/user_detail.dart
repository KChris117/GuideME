import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UserDetail extends StatefulWidget {
  const UserDetail({super.key});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  final user = FirebaseAuth.instance.currentUser;

  // Controllers for each form field
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _profileImageUrlController = TextEditingController();

  String? _profileImageUrl;
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loadData(); // Load data from Firestore when the widget is initialized
  }

  // Function to pick image (local file)
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  // Function to save data to Firestore
  Future<void> _saveData() async {
    try {
      await FirebaseFirestore.instance.collection('user_profile_detail').doc(user?.uid).set({
        'first_name': _firstNameController.text,
        'last_name': _lastNameController.text,
        'phone_number': _phoneNumberController.text,
        'address': _addressController.text,
        'birth_date': _birthDateController.text,
        'email': user?.email,
        'profile_image_url': _profileImageUrlController.text,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User details saved successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving user details: $e')),
      );
    }
  }

  // Function to load data from Firestore
  Future<void> _loadData() async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection('user_profile_detail')
          .doc(user?.uid)
          .get();

      if (doc.exists) {
        final data = doc.data()!;
        setState(() {
          _firstNameController.text = data['first_name'] ?? '';
          _lastNameController.text = data['last_name'] ?? '';
          _phoneNumberController.text = data['phone_number'] ?? '';
          _addressController.text = data['address'] ?? '';
          _birthDateController.text = data['birth_date'] ?? '';
          _profileImageUrlController.text = data['profile_image_url'] ?? '';
          _profileImageUrl = data['profile_image_url'];
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading user details: $e')),
      );
    }
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      title: const Text('Your Details'),
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Your Details',
              style: GoogleFonts.inter(
                fontSize: 35,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 20),
            _profileImage != null
                ? CircleAvatar(
                    radius: 50,
                    backgroundImage: FileImage(_profileImage!),
                  )
                : (_profileImageUrl != null && _profileImageUrl!.isNotEmpty)
                    ? CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(_profileImageUrl!),
                      )
                    : CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey,
                        child: const Icon(Icons.person, size: 40),
                      ),
            const SizedBox(height: 20),
            // Username TextFormField
            TextFormField(
              initialValue: user?.displayName ?? 'Username',
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            // Password TextFormField
            TextFormField(
              initialValue: '*******', // You can handle password more securely
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Password (Encrypted)',
              ),
            ),
            TextFormField(
              initialValue: user?.email,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextFormField(
              controller: _firstNameController,
              decoration: const InputDecoration(
                labelText: 'First Name',
              ),
            ),
            TextFormField(
              controller: _lastNameController,
              decoration: const InputDecoration(
                labelText: 'Last Name',
              ),
            ),
            TextFormField(
              controller: _phoneNumberController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            TextFormField(
              controller: _addressController,
              decoration: const InputDecoration(
                labelText: 'Address',
              ),
            ),
            TextFormField(
              controller: _birthDateController,
              decoration: const InputDecoration(
                labelText: 'Birth Date',
              ),
            ),
            TextFormField(
              controller: _profileImageUrlController,
              decoration: const InputDecoration(
                labelText: 'Profile Picture URL',
              ),
              onChanged: (value) {
                setState(() {
                  _profileImageUrl = value;
                });
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              onPressed: _saveData,
              child: Text(
                'Save',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
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
