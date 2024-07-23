import 'package:flutter/material.dart';
import 'package:myapp/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Brly Store')),
      body: SingleChildScrollView(  
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
