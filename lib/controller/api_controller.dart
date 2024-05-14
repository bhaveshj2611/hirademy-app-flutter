import 'dart:convert';
import 'package:hirademy_flutter_bhavesh/model/book_model.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';

class ApiController with ChangeNotifier {
  List<Book> _books = [];
  Book? _selectedBook;

  List<Book> get books => _books;
  Book? get selectedBook => _selectedBook;

  Future<void> fetchBooks() async {
    final response =
        await http.get(Uri.parse('https://softwium.com/api/books'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      _books = data.map((json) => Book.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load books');
    }
  }

  Future<void> fetchBookDetails(int id) async {
    final response =
        await http.get(Uri.parse('https://softwium.com/api/books/$id'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      _selectedBook = Book.fromJson(data);
      notifyListeners();
    } else {
      throw Exception('Failed to load book details');
    }
  }
}
