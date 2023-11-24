import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bookstore App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BookListScreen(),
    );
  }
}

class BookListScreen extends StatelessWidget {
  final List<String> books = [
    'Дюна - Фрэнк Герберт',
    '1984 - Джордж Оруэлл',
    'Мастер и Маргарита - Михаил Булгаков',
    'Властелин колец - Дж. Р. Р. Толкин',
    'Гарри Поттер и философский камень - Дж. К. Роулинг',
    // Добавьте свои книги
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список книг'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(books[index]),
            subtitle: Text('Автор: Неизвестен'),
            leading: Icon(Icons.book),
            onTap: () {
              // Добавьте обработчик нажатия для перехода к экрану с деталями книги
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailScreen(bookTitle: books[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class BookDetailScreen extends StatelessWidget {
  final String bookTitle;

  BookDetailScreen({required this.bookTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bookTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Название: $bookTitle',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Автор: Неизвестен',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Жанр: Фантастика',
              style: TextStyle(fontSize: 16.0),
            ),
            // Добавьте больше информации о книге по мере необходимости
          ],
        ),
      ),
    );
  }
}