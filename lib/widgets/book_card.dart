import 'package:flutter/material.dart';
import '../models/book.dart';
import '../utils/styles.dart';

class BookCard extends StatelessWidget {
  final Book book;

  BookCard({required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(book.imagePath, width: 50, height: 70, fit: BoxFit.cover),
        title: Text(book.title, style: Styles.title),
        subtitle: Text(book.author, style: Styles.subtitle),
        trailing: Icon(book.isRead ? Icons.check_circle : Icons.bookmark),
      ),
    );
  }
}
