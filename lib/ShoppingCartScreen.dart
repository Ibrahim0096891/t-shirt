import 'package:flutter/material.dart';

class MyBagScreen extends StatefulWidget {
  @override
  _MyBagScreenState createState() => _MyBagScreenState();
}

class _MyBagScreenState extends State<MyBagScreen> {
  List<int> quantities = [1, 1, 1];
  List<int> prices = [51, 30, 43]; // unit prices

  int get totalAmount {
    int total = 0;
    for (int i = 0; i < quantities.length; i++) {
      total += quantities[i] * prices[i];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Bag'),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                _buildCartItem('Pullover', 'Black', 'L', prices[0], 'assets/pullover.png', 0),
                _buildCartItem('T-Shirt', 'Gray', 'L', prices[1], 'assets/tshirt.png', 1),
                _buildCartItem('Sport Dress', 'Black', 'M', prices[2], 'assets/sportdress.png', 2),
              ],
            ),
          ),
          _buildTotalSection(),
        ],
      ),
    );
  }

  Widget _buildCartItem(String title, String color, String size, int price, String imageUrl, int index) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Fixed Image Size
            Image.asset(
              'assets/image/t-shirt.jpg',
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('Color: $color   Size: $size'),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          setState(() {
                            if (quantities[index] > 1) quantities[index]--;
                          });
                        },
                      ),
                      Text('${quantities[index]}', style: TextStyle(fontSize: 16)),
                      IconButton(
                        icon: Icon(Icons.add_circle_outline),
                        onPressed: () {
                          setState(() {
                            quantities[index]++;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Three dot icon
            // Align(
            //   alignment: Alignment.topRight,
            //   child: IconButton(
            //     icon: Icon(Icons.more_horiz), // Three dot icon
            //     onPressed: () {
            //       // Popup menu logic here if needed
            //     },
            //   ),
            // ),
            Text('\$${price * quantities[index]}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total amount:', style: TextStyle(fontSize: 18)),
              Text('\$${totalAmount}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Congratulations! Your checkout is successful.')),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Colors.red,
            ),
            child: Text(
              'CHECK OUT',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}