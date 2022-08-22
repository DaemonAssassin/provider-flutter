import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/counter.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('build');
    return MaterialApp(
      home: ChangeNotifierProvider<Counter>(
        create: (context) => Counter(),
        lazy: true,
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
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Consumer<Counter>(
              builder: (BuildContext context, Counter counter, Widget? child) {
                print('Consumer');
                return Text(
                  '${counter.count}',
                  style: const TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                );
              },
            ),
            const SizedBox(height: 20.0),
            Selector<Counter, int>(
              selector: (BuildContext context, Counter counter) {
                return counter.point;
              },
              builder: (BuildContext context, int points, Widget? child) {
                print('Selector');
                return Text(
                  points.toString(),
                  style: const TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: buildFAO(context),
    );
  }

  Widget buildFAO(BuildContext context) {
    print('buildFAO');
    Counter counter = Provider.of<Counter>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          onPressed: () => counter.increment(),
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: () => counter.decrement(),
          child: const Icon(Icons.remove),
        ),
        FloatingActionButton(
          onPressed: () => counter.increasePoint(),
          child: const Icon(Icons.control_point),
        ),
      ],
    );
  }
}
