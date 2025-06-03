import 'package:flutter/material.dart';

class PurchasePage extends StatefulWidget {
  final String title;
  final String author;
  final double price;

  const PurchasePage({
    super.key,
    required this.title,
    required this.author,
    required this.price,
  });

  @override
  State<PurchasePage> createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  final _formKey = GlobalKey<FormState>();
  String? _cardType = 'Visa';

  final TextEditingController _bookTitleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController(text: '1');
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expirationDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  double get totalPrice {
    final quantity = int.tryParse(_quantityController.text) ?? 1;
    return widget.price * quantity;
  }

  @override
  void initState() {
    super.initState();
    _bookTitleController.text = widget.title;
    _authorController.text = widget.author;

    _quantityController.addListener(() {
      setState(() {}); // Update total price dynamically
    });
  }

  void _submitPurchase() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Proceeding to payment of \$${totalPrice.toStringAsFixed(2)}'),
        ),
      );
      // Here you could integrate payment logic or backend communication.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Purchase Book'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Book Title
                TextFormField(
                  controller: _bookTitleController,
                  decoration: const InputDecoration(labelText: 'Book Title'),
                  readOnly: true,
                ),
                const SizedBox(height: 10),

                // Author
                TextFormField(
                  controller: _authorController,
                  decoration: const InputDecoration(labelText: 'Author'),
                  readOnly: true,
                ),
                const SizedBox(height: 10),

                // Quantity
                TextFormField(
                  controller: _quantityController,
                  decoration: const InputDecoration(labelText: 'Quantity'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Enter quantity';
                    final qty = int.tryParse(value);
                    if (qty == null || qty <= 0) return 'Enter a valid quantity';
                    return null;
                  },
                ),
                const SizedBox(height: 10),

                // Card Type
                DropdownButtonFormField<String>(
                  value: _cardType,
                  items: ['Visa', 'MasterCard', 'Amex'].map((type) {
                    return DropdownMenuItem(value: type, child: Text(type));
                  }).toList(),
                  onChanged: (value) => setState(() => _cardType = value),
                  decoration: const InputDecoration(labelText: 'Card Type'),
                ),
                const SizedBox(height: 10),

                // Card Number
                TextFormField(
                  controller: _cardNumberController,
                  decoration: const InputDecoration(labelText: 'Card Number'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Required';
                    if (value.replaceAll(' ', '').length != 16) return 'Card number must be 16 digits';
                    return null;
                  },
                ),
                const SizedBox(height: 10),

                // Expiration Date
                TextFormField(
                  controller: _expirationDateController,
                  decoration: const InputDecoration(labelText: 'Expiration Date (MM/YY)'),
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Required';
                    final regex = RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$');
                    if (!regex.hasMatch(value)) return 'Invalid format (MM/YY)';
                    return null;
                  },
                ),
                const SizedBox(height: 10),

                // CVV
                TextFormField(
                  controller: _cvvController,
                  decoration: const InputDecoration(labelText: 'CVV'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Required';
                    if (value.length < 3 || value.length > 4) return 'Invalid CVV';
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Total Price
                Text(
                  'Total: \$${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),

                // Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitPurchase,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 161, 157, 158),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text('Proceed to Payment'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
