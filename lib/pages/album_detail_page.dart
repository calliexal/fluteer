import 'package:flutter/material.dart';
import '../models/album.dart';
import '../colors.dart'; 

class AlbumDetailPage extends StatelessWidget {
  final Album album;
  final List<Map<String, dynamic>> cartItems;

  AlbumDetailPage({required this.album, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(album.title)),
      body: Container(
        color: sanguineBrown, 
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(album.imageUrl, width: 200, height: 200),
              SizedBox(height: 20),
              Text(
                album.title,
                style: TextStyle(fontSize: 24, color: Colors.white), 
              ),
              Text(
                'by ${album.artist}',
                style: TextStyle(fontSize: 18, color: Colors.grey[200]), 
              ),
              SizedBox(height: 20),
              Text(
                '\$${album.price}',
                style: TextStyle(fontSize: 24, color: Colors.white), 
              ),
              SizedBox(height: 20),
              Text(
                album.description,
                style: TextStyle(color: Colors.white), 
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    cartItems.add({
                      'title': album.title,
                      'price': album.price,
                      'quantity': 1,
                    });
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange, 
                    foregroundColor: Colors.white, 
                  ),
                  child: Text('Add to Cart'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
