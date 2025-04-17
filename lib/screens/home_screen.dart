import 'package:flutter/material.dart';
import 'add_book_screen.dart';

class Book {
  final String title;
  final String author;
  final bool isRead;

  Book({required this.title, required this.author, required this.isRead});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Book> _books = [];

  void _addBook(String title, String author, bool isRead) {
    setState(() {
      _books.add(Book(title: title, author: author, isRead: isRead));
    });
  }

  int get readCount => _books.where((book) => book.isRead).length;
  int get unreadCount => _books.where((book) => !book.isRead).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lidos: $readCount  |  Por ler: $unreadCount'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Text('Categorias', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(title: Text('Ficção')),
            ListTile(title: Text('Não Ficção')),
            ListTile(title: Text('Histórias Infantis')),
          ],
        ),
      ),
      body: _books.isEmpty
          ? const Center(child: Text('Nenhum livro adicionado ainda.'))
          : ListView.builder(
              itemCount: _books.length,
              itemBuilder: (ctx, index) {
                final book = _books[index];
                return ListTile(
                  leading: const Icon(Icons.book),
                  title: Text(
                    book.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(book.author),
                  trailing: Icon(
                    book.isRead ? Icons.check_circle : Icons.hourglass_bottom,
                    color: book.isRead ? Colors.green : Colors.orange,
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddBookScreen(onAdd: _addBook),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
