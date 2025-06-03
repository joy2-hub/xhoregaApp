import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorites_provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<FavoritesProvider>(context).favoriteBooks;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Books'),
        backgroundColor: const Color.fromARGB(255, 190, 185, 187),
      ),
      body: favorites.isEmpty
          ? const Center(child: Text('No favorite books yet.'))
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final book = favorites[index];
                return ListTile(
                  leading: const Icon(Icons.book),
                  title: Text(book['title'] ?? ''),
                  subtitle: Text(book['author'] ?? ''),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      // Toggle the favorite status to remove it from the list
                      Provider.of<FavoritesProvider>(context, listen: false)
                          .toggleFavorite(book);
                    },
                  ),
                );
              },
            ),
    );
  }
}
