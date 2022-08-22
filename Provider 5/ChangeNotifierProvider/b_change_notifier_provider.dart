// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

// Counter app with provider

class Counter with ChangeNotifier {
  int count = 0;

  void increment() {
    ++count;
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>(
      create: (context) => Counter(),
      child: const FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page Title"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<Counter>(
              builder: (context, counter, child) => Text(
                '${counter.count}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Builder(
              builder: (context) {
                final counter = Provider.of<Counter>(context, listen: false);
                return RaisedButton(
                  onPressed: () => counter.increment(),
                  child: const Text("Increment"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
