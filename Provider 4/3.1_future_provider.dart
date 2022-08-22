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
            child: FutureProvider<String>(
              create: (context) => Person().fetchAddress,
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
      var personR = Provider.of<Person>(context);
      var add = Provider.of<String>(context);
      print('builder **');
      return Column(
        children: [
          Consumer<Person>(
            builder: (BuildContext context, Person person, Widget? child) {
              print('person co');
              return Text(
                '${personR.rollNo}',
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
            print('string con');
            return Text(
              add,
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
  Future<String> get fetchAddress {
    return Future.delayed(
      const Duration(seconds: 3),
      () => throw 'Something went wrong',
    );
  }
}
