import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RecipeListScreen(),
    );
  }
}

class RecipeListScreen extends StatelessWidget {
  final List<String> recipes = [
    'Паста карбонара',
    'Салат Цезарь',
    'Греческий салат',
    'Борщ',
    'Суп-гуляш',
    // Добавьте свои рецепты
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список рецептов'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recipes[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetailScreen(recipeName: recipes[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class RecipeDetailScreen extends StatelessWidget {
  final String recipeName;

  RecipeDetailScreen({required this.recipeName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipeName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Здесь будет подробная информация о рецепте "$recipeName".',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}