import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Sharing App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CarListScreen(),
    );
  }
}

class CarListScreen extends StatelessWidget {
  final List<String> cars = [
    'Toyota Prius',
    'Honda Civic',
    'Ford Focus',
    'Chevrolet Malibu',
    'Volkswagen Passat',
    // Добавьте свои автомобили
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список автомобилей'),
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cars[index]),
            subtitle: Text('Гос. номер: ABC123'),
            leading: Icon(Icons.directions_car),
            onTap: () {
              // Добавьте обработчик нажатия для перехода к экрану с деталями автомобиля
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CarDetailScreen(carName: cars[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CarDetailScreen extends StatelessWidget {
  final String carName;

  CarDetailScreen({required this.carName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(carName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Модель: $carName',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Гос. номер: ABC123',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Год выпуска: 2022',
              style: TextStyle(fontSize: 16.0),
            ),
            // Добавьте больше информации о автомобиле по мере необходимости
          ],
        ),
      ),
    );
  }
}