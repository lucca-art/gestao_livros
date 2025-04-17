import '../models/book.dart';

class BookController {
  List<Book> _books = [];

  List<Book> get books => _books;

  void addBook(Book book) {
    _books.add(book);
  }

  int get totalRead => _books.where((b) => b.isRead).length;
  int get totalUnread => _books.where((b) => !b.isRead).length;

  List<Book> byCategory(String category) {
    return _books.where((b) => b.category == category).toList();
  }
}
