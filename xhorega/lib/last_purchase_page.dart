import 'package:flutter/material.dart';

class LastPurchasePage extends StatelessWidget {
  final String bookTitle;
  final String author;
  final double price;
  final int quantity;

  const LastPurchasePage({
    super.key,
    required this.bookTitle,
    required this.author,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    final total = price * quantity;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Last Purchase Summary'),
        backgroundColor: Color.fromARGB(255, 161, 157, 158),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Book Title: $bookTitle", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text("Author: $author", style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                Text("Price per book: \$$price", style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                Text("Quantity: $quantity", style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                Text("Total: \$${total.toStringAsFixed(2)}", style: const TextStyle(fontSize: 18, color: Colors.green)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
