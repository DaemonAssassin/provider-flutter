import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'StreamProvider Demo';
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamProvider<int>(
        initialData: 0,
        create: (context) {
          // Pretend this is loading data and reporting the percent loaded.
          return Stream<int>.periodic(
            const Duration(milliseconds: 100),
            (count) => count + 1,
          ).take(100);
        },
        child: const Home(appTitle: appTitle),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    Key? key,
    required this.appTitle,
  }) : super(key: key);

  final String appTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<int>(
              builder: (context, int percentDone, child) {
                if (percentDone < 100) {
                  return Text("Loading... ($percentDone% done)");
                }
                return const Text("Done loading!");
              },
            ),
          ],
        ),
      ),
    );
  }
}
