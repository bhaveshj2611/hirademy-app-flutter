import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hirademy_flutter_bhavesh/controller/api_controller.dart';
import 'package:hirademy_flutter_bhavesh/routes/route_name.dart';
import 'package:provider/provider.dart';

class BookList extends StatelessWidget {
  const BookList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books'),
      ),
      body: Consumer<ApiController>(
        builder: (context, apiService, child) {
          if (apiService.books.isEmpty) {
            apiService.fetchBooks();
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: apiService.books.length,
              itemBuilder: (context, index) {
                final book = apiService.books[index];
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () {
                      apiService.fetchBookDetails(book.id);
                      Navigator.of(context).pushNamed(RouteName.bookDetails);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 10,
                                spreadRadius: 1,
                                offset: const Offset(0, 4))
                          ],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 200,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child: Text(
                                    book.title,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Hero(
                              tag: 'book_${book.id}',
                              child: Image.asset(
                                'assets/images/book.png',
                                fit: BoxFit.fill,
                                width: 120,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
