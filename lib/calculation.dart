import 'package:mod_13/required.dart';

List<Item> items = [
  Item(
      name: 'Pullover',
      color: 'Black',
      size: 'L',
      price: 51,
      quantity: 1,
      imageUrl: 'assets/image/t-shirt.jpg'),
  Item(
      name: 'T-Shirt',
      color: 'Gray',
      size: 'L',
      price: 30,
      quantity: 1,
      imageUrl: 'assets/image/t-shirt.jpg'),
  Item(
      name: 'Sport Dress',
      color: 'Black',
      size: 'M',
      price: 43,
      quantity: 1,
      imageUrl: 'assets/image/ft-shirt.jpeg'),
];


int calculateTotalAmount() {
  int total = 0;
  for (var item in items) {
    total += item.price * item.quantity;
  }
  return total;
}