import 'package:flutter/material.dart';
import 'edit_profil_page.dart';
import '../colors.dart';

class ProfilePage extends StatefulWidget {
  final List<Map<String, dynamic>> orders;

  ProfilePage({required this.orders});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  void _loadInitialData() {
    _nameController.text = 'Al';
    _emailController.text = 'Alamak@gmail.com';
    _addressController.text = '22 bakung';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Profile saved')));
  }

  void _navigateToEditProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilePage(
          nameController: _nameController,
          emailController: _emailController,
          addressController: _addressController,
          onSave: _saveProfile,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      backgroundColor: whiteRock,
      body: Container(
        color: whiteRock, 
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      filled: true,
                      fillColor: whiteRock, 
                    ),
                    enabled: false, 
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: whiteRock, 
                    ),
                    enabled: false,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: TextField(
                    controller: _addressController,
                    decoration: InputDecoration(
                      labelText: 'Address',
                      filled: true,
                      fillColor: whiteRock, 
                    ),
                    enabled: false,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _navigateToEditProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: sanguineBrown,
                  ),
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
