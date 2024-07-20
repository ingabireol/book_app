import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../db/book_dao.dart';

class HomePage extends StatelessWidget {
  final BookDao _bookDao = BookDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('My Books'),
              onTap: () {
                context.go('/mybooks');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.go('/addBook');
          },
          child: Text('Add Book'),
        ),
      ),
    );
  }
}
