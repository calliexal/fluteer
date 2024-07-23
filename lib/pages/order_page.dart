import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  final List<Map<String, dynamic>> orders;

  OrderPage({required this.orders});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return ListTile(
            title: Text(order['title']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Quantity: ${order['quantity']}'),
                Text('Address: ${order['address']}'),
                Text('Payment Method: ${order['paymentMethod']}'),
                Text('Payment Code: ${order['paymentCode']}'),
                Text('Status: ${order['status']}'),
              ],
            ),
            trailing: Text('\$${order['price']}'),
          );
        },
      ),
    );
  }
}