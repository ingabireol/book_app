import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../db/book_dao.dart';
import '../model/book_model.dart';

class AddBookScreen extends StatefulWidget {
  @override
  _AddBookScreenState createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _descriptionController = TextEditingController();
  final BookDao _bookDao = BookDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Book'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _authorController,
                decoration: InputDecoration(labelText: 'Author'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an author';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final book = Book(
                      title: _titleController.text,
                      author: _authorController.text,
                      description: _descriptionController.text,
                    );
                    var saved = await _bookDao.addBook(book);
                    print(saved);
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          var message =
                              saved > 0 ? "Saved Successfully" : "Not Saved";
                          return SizedBox(
                            height: 400.0,
                            child: Center(
                              child: Row(
                                children: [
                                  Text(message),
                                  ElevatedButton(
                                      onPressed: () {
                                        context.go("/");
                                      },
                                      child: Icon(Icons.check_circle))
                                ],
                              ),
                            ),
                          );
                        });
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
