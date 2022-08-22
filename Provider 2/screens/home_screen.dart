import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/counter.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build');
    Counter counter = Provider.of<Counter>(context, listen: false);
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (BuildContext context, Counter model, Widget? child) {
            return Text(
              '${model.counter}',
              style: const TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
