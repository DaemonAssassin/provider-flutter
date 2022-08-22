import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter.dart';

void main(List<String> args) {
  runApp(const MyAppWidget());
}

class MyAppWidget extends StatelessWidget {
  const MyAppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<Counter>(
        create: (context) => Counter(),
        child: const Home(),
      ),
    );
  }
}

// ignore: must_be_immutable
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Counter counter = Provider.of<Counter>(context, listen: false);
    print('build calling');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.increment();
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Consumer<Counter>(builder: (context, counter, child) {
          print('consumer');
          return Text(
            '${counter.count}',
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
