class Book {
  final String title;
  final String author;
  final String imagePath;
  final String category;
  final bool isRead;

  Book({
    required this.title,
    required this.author,
    required this.imagePath,
    required this.category,
    this.isRead = false,
  });
}
