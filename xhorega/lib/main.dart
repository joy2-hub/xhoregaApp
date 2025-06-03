
 import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'profilepage.dart';
import 'category_books_page.dart';
import 'favorites_provider.dart';
import 'favorites_page.dart';
import 'splash_screen.dart';
import 'cart_page.dart';
import 'about_us_page.dart';
import 'privacy_policy_page.dart';
import 'checkout_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => FavoritesProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Store',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomePage(),
        '/favorites': (context) => const FavoritesPage(),
        '/lastPurchase': (context) => const Placeholder(),
        '/profile': (context) => const ProfilePage(),
        '/about': (context) => const AboutUsPage(),
        '/privacy': (context) => const PrivacyPolicyPage(),
        '/checkout': (context) => const CheckoutPage(), // ✅ New route
      },
    );
  }
}





class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<String> popularBooks = const [
    "img/book16.JPG",
    "img/book21.JPG",
    "img/book51.JPG",
    "img/book44.JPG",
    "img/book40.JPG",
    "img/book33.JPG",
    "img/book27.JPG",
    "img/book62.JPG",
  ];

  Widget buildCategoryTile({
    required BuildContext context,
    required String title,
    required String imageUrl,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryBooksPage(category: title),
          ),
        );
      },
      child: Container(
        height: 150,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.star, color: Colors.amber, size: 24),
                        SizedBox(width: 8),
                        Text(
                          "Popular Books",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                    PopupMenuButton<String>(
                      icon: const Icon(Icons.more_vert),
                      onSelected: (value) {
                        if (value == 'home') {
                          Navigator.pushNamed(context, '/about');
                        } else if (value == 'privacy') {
                          Navigator.pushNamed(context, '/privacy');
                        }
                      },
                      itemBuilder: (BuildContext context) => [
                        const PopupMenuItem<String>(
                          value: 'home',
                          child: Text('Home Page'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'privacy',
                          child: Text('Private Policies & Conditions'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: popularBooks.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 12),
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(popularBooks[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              buildCategoryTile(
                context: context,
                title: "Science Fiction",
                imageUrl: "assets/fiction.JPG",
              ),
              buildCategoryTile(
                context: context,
                title: "Self-Help",
                imageUrl: "assets/self.JPG",
              ),
              buildCategoryTile(
                context: context,
                title: "Fantasy",
                imageUrl: "assets/fant.JPG",
              ),
              buildCategoryTile(
                context: context,
                title: "Contemporary Romance",
                imageUrl: "assets/rom.JPG",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/profile');
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const CartPage(),
              ),
            );
          } else if (index == 2) {
            Navigator.pushNamed(context, '/favorites');
          }
        },
      ),
    );
  }
} 