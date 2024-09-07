import 'package:flutter/material.dart';
import 'package:mod_13/required.dart';

class CartItem extends StatelessWidget {
  final Item item;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const CartItem({
    required this.item,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              item.imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Color: ${item.color}  Size: ${item.size}'),
                ],
              ),
            ),
            SizedBox(width: 8),
            Row(
              children: [
                IconButton(
                  onPressed: onRemove,
                  icon: Icon(Icons.remove_circle_outline),
                ),
                Text('${item.quantity}'),
                IconButton(
                  onPressed: onAdd,
                  icon: Icon(Icons.add_circle_outline),
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert, color: Colors.white), // Red icon
                ),
                Text(
                  '${item.price * item.quantity}\$',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
