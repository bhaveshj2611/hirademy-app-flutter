import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hirademy_flutter_bhavesh/controller/api_controller.dart';
import 'package:provider/provider.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Details'),
      ),
      body: Consumer<ApiController>(
        builder: (context, apiService, child) {
          if (apiService.selectedBook == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final book = apiService.selectedBook!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'ISBN: ${book.isbn}',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange),
                  ),
                  Hero(
                    tag: 'book_${book.id}',
                    child: Image.asset(
                      'assets/images/book.png',
                      fit: BoxFit.fill,
                      width: 400,
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    book.title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      'By: ${book.authors.join(", ")}',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'No. of Pages: ${book.pageCount}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
