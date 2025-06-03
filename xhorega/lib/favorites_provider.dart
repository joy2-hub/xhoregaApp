import 'package:flutter/material.dart';

class FavoritesProvider with ChangeNotifier {
  List<Map<String, dynamic>> _favoriteBooks = [];

  // Get the list of favorite books
  List<Map<String, dynamic>> get favoriteBooks => _favoriteBooks;

  // Check if a book is a favorite
  bool isFavorite(Map<String, dynamic> book) {
    return _favoriteBooks.contains(book);
  }

  // Toggle the favorite status of a book
  void toggleFavorite(Map<String, dynamic> book) {
    if (isFavorite(book)) {
      _favoriteBooks.remove(book);
    } else {
      _favoriteBooks.add(book);
    }
    notifyListeners();  // Notify listeners to update the UI
  }
}
