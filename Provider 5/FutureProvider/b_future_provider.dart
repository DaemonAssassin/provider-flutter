import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Person {
  Person({required this.name, required this.age});

  final String name;
  int age;
}

class Home {
  final String city = "Portland";

  Future<String> get fetchAddress {
    final address = Future.delayed(const Duration(seconds: 2), () {
      return '1234 North Commercial Ave.';
    });

    return address;
  }
}

void main() {
  runApp(
    Provider<Person>(
      create: (_) => Person(name: 'Yohan', age: 25),
      child: FutureProvider<String>(
        create: (context) => Home().fetchAddress,
        initialData: "fetching address...",
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        title: const Text("Future Provider"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Consumer<Person>(
            builder: (context, Person person, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("User profile:"),
                  Text("name: ${person.name}"),
                  Text("age: ${person.age}"),
                  Consumer<String>(builder: (context, String address, child) {
                    return Text("address: $address");
                  }),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
