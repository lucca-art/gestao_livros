import 'package:flutter/material.dart';

class CategoryDrawer extends StatelessWidget {
  final Function(String) onSelect;

  const CategoryDrawer({required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final categories = ['Ficção', 'Não Ficção', 'Histórias Infantis'];

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Text("Categorias")),
          ...categories.map((cat) => ListTile(
                title: Text(cat),
                onTap: () => onSelect(cat),
              )),
        ],
      ),
    );
  }
}
