import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/person.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Provider<Person>(
        create: (context) => Person(age: 22, name: 'Mateen', rollNo: 29),
        child: const Home(),
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
    Person person = Provider.of<Person>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: Text(
            """
${person.age}
${person.name}
${person.rollNo}
""",
            style: const TextStyle(
              fontSize: 48.0,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
        ),
      ),
    );
  }
}
