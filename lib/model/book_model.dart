class Book {
  final int id;
  final String title;
  final String isbn;
  final int pageCount;
  final List<String> authors;

  Book({
    required this.id,
    required this.title,
    required this.isbn,
    required this.pageCount,
    required this.authors,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'No Title',
      isbn: json['isbn'] ?? '',
      pageCount: json['pageCount'] ?? 0,
      authors: (json['authors'] as List<dynamic>?)
              ?.map((author) => author.toString())
              .toList() ??
          [],
    );
  }
}
