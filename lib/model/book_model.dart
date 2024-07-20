class Book {
  int? id;
  String title;
  String author;
  String description;

  Book(
      {this.id,
      required this.title,
      required this.author,
      required this.description});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'description': description,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'],
      title: map['title'],
      author: map['author'],
      description: map['description'],
    );
  }
}
