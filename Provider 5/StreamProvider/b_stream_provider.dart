import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//! Model Class
class Person {
  Person({required this.name, required this.initialAge});

  final String name;
  final int initialAge;

  //! Stream Source (Stream Generator function)
  Stream<String> get age async* {
    var i = initialAge;
    while (i < 85) {
      await Future.delayed(const Duration(seconds: 1));
      i++;
      yield i.toString();
    }
  }
}

void main() {
  runApp(
    //! StreamProvider<T>
    StreamProvider<String>(
      create: (_) => Person(name: 'Mateen', initialAge: 18).age,
      initialData: 18.toString(),
      catchError: (BuildContext context, Object? error) => error.toString(),
      child: const MyApp(),
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
          //! Consumer<T>
          child: Consumer<String>(
            builder: (context, String age, child) {
              return Column(
                children: <Widget>[
                  const Text("Watch Mateen Age..."),
                  const Text("name: Mateen"),
                  Text("age: $age"),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
