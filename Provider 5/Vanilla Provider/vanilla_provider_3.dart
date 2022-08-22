// used in test.dart
// used in test.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//! Model Class
class Person {
  Person({required this.name, required this.age});

  final String name;
  final int age;
}

void main() {
  //! value
  var person = Person(name: 'Mateen', age: 22);
  runApp(
    //! Provider.value
    Provider.value(
      value: person,
      child: MyApp(),
    ),
  );
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Class'),
      ),
      body: Center(
        child: Text(
          //! Dependents Widgets (State)
          '''
          Hi ${context.select<Person, String>((Person p) => p.name)}!
          You are ${Provider.of<Person>(context).age} years old''',
        ),
      ),
    );
  }
}
