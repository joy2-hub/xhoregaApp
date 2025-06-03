import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cardNumberController = TextEditingController();
    final nameController = TextEditingController();
    final expController = TextEditingController();
    final cvvController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Payment')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name on Card'),
            ),
            TextField(
              controller: cardNumberController,
              decoration: const InputDecoration(labelText: 'Card Number'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: expController,
              decoration: const InputDecoration(labelText: 'Expiration Date'),
            ),
            TextField(
              controller: cvvController,
              decoration: const InputDecoration(labelText: 'CVV'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Simulate success
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Payment successful!')),
                );
                Navigator.pop(context);
              },
              child: const Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }
}
