import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamProvider<int>(
        create: (context) => Stream.periodic(
          const Duration(seconds: 1),
          (int count) {
            return count;
          },
        ).take(50),
        initialData: 0,
        builder: (BuildContext context, Widget? child) {
          return const Home();
        },
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Consumer<int>(builder: (context, int count, child) {
          print('consumer');
          return Text(
            '$count',
            style: const TextStyle(
              fontSize: 48.0,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          );
        }),
      ),
    );
  }
}
