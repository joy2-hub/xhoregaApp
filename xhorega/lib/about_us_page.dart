import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F4F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD6C6E1),
        title: const Text('About Us'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'About Us',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6A4C93),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Welcome to Xhorega bookstore, your ultimate destination for discovering, buying, and enjoying the best books across all genres!',
                    style: TextStyle(fontSize: 16, height: 1.6),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'At Xhorega bookstore, we believe in the magic of reading. Whether you\'re a passionate bookworm, a casual reader, or just looking for your next great read, we’ve got something special for you. Our carefully curated collection includes bestsellers, hidden gems, classics, and the latest releases—all at your fingertips.',
                    style: TextStyle(fontSize: 16, height: 1.6),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Our mission is simple: to connect readers with books they’ll love. We’re more than just a bookstore—we’re a community of book lovers who celebrate stories, knowledge, and imagination.',
                    style: TextStyle(fontSize: 16, height: 1.6),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Happy reading!',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'The xhorega bookstore Team',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
