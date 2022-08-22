import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'FutureProvider Demo';
    return MaterialApp(
        title: appTitle,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureProvider<bool>(
          initialData: true,
          create: (context) {
            // Pretend we're saving data and it takes 4 seconds.
            return Future.delayed(const Duration(seconds: 4), () => false);
          },
          child: const Home(appTitle: appTitle),
        ));
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
            Consumer<bool>(
              builder: (context, saving, child) {
                return Text(saving ? "Saving..." : "Saved!");
              },
            ),
          ],
        ),
      ),
    );
  }
}
