import '../model/book_model.dart';
import 'databasehelper.dart';

class BookDao {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<int> addBook(Book book) async {
    return await _dbHelper.insertBook(book);
  }

  Future<List<Book>> getBooks() async {
    return await _dbHelper.getBooks();
  }

  Future<void> updateBook(Book book) async {
    await _dbHelper.updateBook(book);
  }

  Future<void> deleteBook(int id) async {
    await _dbHelper.deleteBook(id);
  }
}
