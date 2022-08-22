import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(const MyAppWidget());
}

class MyAppWidget extends StatelessWidget {
  const MyAppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build');
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Provider<Person>(
            create: (context) => Person(),
            child: StreamProvider<String>(
              create: (context) => Person().fetchNames,
              initialData: 'Bwp',
              catchError: (BuildContext context, Object? error) {
                return 'Error';
              },
              updateShouldNotify: (String perviousValue, String newValue) {
                return true;
              },
              child: const Child(),
            ),
          ),
        ),
      ),
    );
  }
}

class Child extends StatelessWidget {
  const Child({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      // var personR = Provider.of<Person>(context);
      // var add = Provider.of<String>(context);
      print('I am builder');
      return Column(
        children: [
          Consumer<Person>(
            builder: (BuildContext context, Person person, Widget? child) {
              print('I am Person Consumer');
              return Text(
                '${person.rollNo}',
                style: const TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              );
            },
          ),
          Consumer<String>(
              builder: (BuildContext context, String address, Widget? child) {
            print('I am Names Consumer');
            return Text(
              address,
              style: const TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            );
          }),
        ],
      );
    });
  }
}

class Person {
  int rollNo = 10;
  Stream<String> get fetchNames async* {
    // return Stream.fromIterable(['mateen', 'ali', 'usama', 'saood', 'hamza']);
    var iter = ['mateen', 'ali', 'usama', 'saood', 'hamza'];
    for (var i in iter) {
      await Future.delayed(const Duration(seconds: 2));
      yield i;
    }
  }
}
