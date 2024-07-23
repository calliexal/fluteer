import 'package:flutter/material.dart';
import '../colors.dart';

class EditProfilePage extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController addressController;
  final VoidCallback onSave;

  EditProfilePage({
    required this.nameController,
    required this.emailController,
    required this.addressController,
    required this.onSave,
  });

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Profile')),
      body: Container(
        color: whiteRock, 
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: widget.nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: widget.emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: widget.addressController,
              decoration: InputDecoration(
                labelText: 'Address',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: widget.onSave,
              style: ElevatedButton.styleFrom(
                backgroundColor: sanguineBrown,
              ),
              child: Text(
                'Save Profile',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}