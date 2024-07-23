import 'package:flutter/material.dart';
import '../models/album.dart';
import 'album_detail_page.dart';
import 'cart_page.dart';
import 'profile_page.dart';
import 'order_page.dart'; 
import '../colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Album> albums = [
    Album(
      id: 1,
      title: 'Voicenotes',
      artist: 'Charlie Puth',
      price: 23.99,
      imageUrl: 'image/album1.jpg',
      description: 'Charlie Puth 2018 Release',
    ),
    Album(
      id: 2,
      title: 'i met you when i was 18',
      artist: 'Lauv',
      price: 29.08,
      imageUrl: 'image/album2.jpg',
      description: 'Lauv 2018 release',
    ),
    Album(
      id: 3,
      title: 'Doo-Wops & Hooligans',
      artist: 'Bruno Mars',
      price: 21.97,
      imageUrl: 'image/album3.jpg',
      description: 'Bruno Mars 2010 release',
    ),
    Album(
      id: 4,
      title: 'One Love',
      artist: 'Blue',
      price: 23.99,
      imageUrl: 'image/album4.jpg',
      description: 'Blue 2002 release',
    ),
    Album(
      id: 5,
      title: 'II',
      artist: 'Boyz II Men',
      price: 25.99,
      imageUrl: 'image/album5.jpg',
      description: 'Boyz II Men 1994 release',
    ),
    Album(
      id: 6,
      title: 'Cooleyhighharmony',
      artist: 'Boyz II Men',
      price: 27.99,
      imageUrl: 'image/album6.jpg',
      description: 'Boyz II Men 2001 release',
    ),
    Album(
      id: 7,
      title: 'Back At One',
      artist: 'Brian McKnight',
      price: 19.95,
      imageUrl: 'image/album7.jpg',
      description: 'Brian McKnight 1999 release',
    ),
    Album(
      id: 8,
      title: 'Legacy',
      artist: 'Boyz II Men',
      price: 18.99,
      imageUrl: 'image/album8.jpg',
      description: 'Boyz II Men 2001 release',
    ),
    Album(
      id: 9,
      title: 'Love Potion',
      artist: 'All-4-One',
      price: 19.99,
      imageUrl: 'image/album9.jpg',
      description: 'All-4-one 1996 release',
    ),
    Album(
      id: 10,
      title: 'Minutes to Midnight',
      artist: 'Linkin Park',
      price: 23.99,
      imageUrl: 'image/album10.jpg',
      description: 'Linkin Park 2012 release',
    ),
    Album(
      id: 11,
      title: 'No Strings Attached',
      artist: '*NSYNC',
      price: 19.30,
      imageUrl: 'image/album11.jpg',
      description: 'Nsync 2000 release',
    ),
    Album(
      id: 12,
      title: 'Coast To Coast',
      artist: 'Westlife',
      price: 19.30,
      imageUrl: 'image/album12.jpg',
      description: 'Westlife 2000 release',
    ),
    Album(
      id: 13,
      title: 'Backstreet Boys',
      artist: 'Backstreet Boys',
      price: 15.30,
      imageUrl: 'image/album13.jpg',
      description: 'Backstreet Boys 1996 release',
    ),
    Album(
      id: 14,
      title: 'Backstreet Back',
      artist: 'Backstreet Boys',
      price: 17.30,
      imageUrl: 'image/album14.jpg',
      description: 'bakcstreet Boys 1997 release',
    ),
    Album(
      id: 15,
      title: 'Fe304:Break',
      artist: 'Nmixx',
      price: 23.10,
      imageUrl: 'image/album15.jpg',
      description: 'Nmixx 1st Album',
    ),
  ];

  List<Album> filteredAlbums = [];
  final List<Map<String, dynamic>> cartItems = [];
  final List<Map<String, dynamic>> orders = [];

  @override
  void initState() {
    super.initState();
    filteredAlbums = albums;
  }

  void _filterAlbums(String query) {
    final results = albums
        .where(
            (album) => album.artist.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      filteredAlbums = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CartPage(cartItems: cartItems, orders: orders),
                    ),
                  );
                },
              ),
              if (cartItems.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Text(
                      cartItems.length.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(255, 231, 232, 214),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  onChanged: (value) => _filterAlbums(value),
                  decoration: InputDecoration(
                    labelText: 'Search by Artist',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search, color: sanguineBrown),
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: filteredAlbums.length,
                itemBuilder: (context, index) {
                  final album = filteredAlbums[index];
                  return ListTile(
                    leading: Image.asset(album.imageUrl, width: 50, height: 50),
                    title: Text(album.title),
                    subtitle: Text(album.artist),
                    trailing: Text('\$${album.price}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AlbumDetailPage(
                              album: album, cartItems: cartItems),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu', style: TextStyle(color: Colors.white)),
              decoration: BoxDecoration(color: sanguineBrown),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Cart'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CartPage(cartItems: cartItems, orders: orders),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(orders: orders),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Orders'), 
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        OrderPage(orders: orders), 
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
