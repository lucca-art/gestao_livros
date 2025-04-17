import 'package:flutter/material.dart';

class AddBookScreen extends StatefulWidget {
  final Function(String, String, bool) onAdd;

  const AddBookScreen({super.key, required this.onAdd});

  @override
  State<AddBookScreen> createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  bool _isRead = false;

  void _submit() {
    final title = _titleController.text.trim();
    final author = _authorController.text.trim();

    if (title.isEmpty || author.isEmpty) return;

    widget.onAdd(title, author, _isRead);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Livro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _authorController,
              decoration: const InputDecoration(labelText: 'Autor'),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text('Já foi lido?'),
                Switch(
                  value: _isRead,
                  onChanged: (value) {
                    setState(() {
                      _isRead = value;
                    });
                  },
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: _submit,
              icon: const Icon(Icons.check),
              label: const Text('Salvar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
