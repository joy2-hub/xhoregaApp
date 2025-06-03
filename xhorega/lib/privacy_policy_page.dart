import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD6C6E1),
        title: const Text('Privacy Policy'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Privacy Policy',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6A4C93),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'At xhorega bookstore, we take your privacy seriously. This Privacy Policy explains how we collect, use, and protect your personal information when you use our app.',
                    style: TextStyle(fontSize: 16, height: 1.6),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Information We Collect',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('- Personal Information: Name, email address, phone number, and shipping details.'),
                  Text('- Payment Information: Secure payment details processed via third-party providers.'),
                  Text('- Usage Data: Information about your interaction with our app.'),
                  SizedBox(height: 20),
                  Text(
                    'How We Use Your Information',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('- To process and deliver your orders.'),
                  Text('- To personalize your reading recommendations.'),
                  Text('- To improve our app and services.'),
                  Text('- To send updates, promotions, and newsletters.'),
                  SizedBox(height: 20),
                  Text(
                    'Data Security',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('We implement industry-standard security measures to protect your data from unauthorized access or misuse.'),
                  SizedBox(height: 20),
                  Text(
                    'Third-Party Services',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('We may use third-party services that have their own privacy policies. Please review them.'),
                  SizedBox(height: 20),
                  Text(
                    'Your Rights',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('- Access, update, or delete your personal information.'),
                  Text('- Opt out of marketing communications.'),
                  Text('- Request data portability.'),
                  SizedBox(height: 20),
                  Text(
                    'Changes to This Policy',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('We may update this Privacy Policy occasionally. Any changes will be posted in the app.'),
                  SizedBox(height: 20),
                  Text(
                    'Contact Us',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('For questions about this policy, email us at: support@xhoregabookstore.com'),
                  SizedBox(height: 16),
                  Text(
                    'Thank you for trusting Xhorega Bookstore with your reading journey! 📚',
                    style: TextStyle(fontWeight: FontWeight.w500),
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
