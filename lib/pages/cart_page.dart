import 'package:flutter/material.dart';
import 'dart:math';
import '../colors.dart';

class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;
  final List<Map<String, dynamic>> orders;

  CartPage({required this.cartItems, required this.orders});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final TextEditingController addressController = TextEditingController();
  String paymentMethod = 'Credit Card';
  String paymentCode = '';

  void _generatePaymentCode() {
    final random = Random();
    paymentCode = List.generate(10, (_) => random.nextInt(10)).join();
  }

  void _payNow() {
    if (addressController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    _generatePaymentCode();
    setState(() {
      widget.orders.addAll(widget.cartItems.map((item) => {
            'title': item['title'],
            'price': item['price'],
            'quantity': item['quantity'],
            'status': 'Paid',
            'address': addressController.text,
            'paymentMethod': paymentMethod,
            'paymentCode': paymentCode,
          }));
      widget.cartItems.clear();
    });
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: sanguineBrown,  // Warna background untuk seluruh layar
      child: Scaffold(
        backgroundColor: Colors.transparent,  // Atur scaffold menjadi transparan
        appBar: AppBar(
          title: Text('Cart'),
          backgroundColor: sanguineBrown,  // Warna background untuk AppBar
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ...widget.cartItems.map((item) => ListTile(
                      title: Text(
                        item['title'],
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        'Quantity: ${item['quantity']}',
                        style: TextStyle(color: Colors.grey[200]),
                      ),
                      trailing: Text(
                        '\$${item['price']}',
                        style: TextStyle(color: Colors.white),
                      ),
                      leading: IconButton(
                        icon: Icon(Icons.remove_circle, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            widget.cartItems.remove(item);
                          });
                        },
                      ),
                    )),
                TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: paymentMethod,
                  items: ['Credit Card', 'Debit Card', 'PayPal']
                      .map((String method) {
                    return DropdownMenuItem<String>(
                      value: method,
                      child: Text(method, style: TextStyle(color: Colors.black)),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      paymentMethod = newValue!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Payment Method',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                  dropdownColor: sanguineBrown,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _payNow,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Pay Now'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
