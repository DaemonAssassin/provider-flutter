// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureProvider<MyModel>(
      initialData: MyModel(someValue: 'default value'),
      create: (context) => someAsyncFunctionToGetMyModel(),
      child: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('My App')),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                padding: const EdgeInsets.all(20),
                color: Colors.green[200],
                child: Consumer<MyModel>(
                  builder: (context, myModel, child) {
                    return RaisedButton(
                      child: const Text('Do something'),
                      onPressed: () {
                        myModel.doSomething();
                      },
                    );
                  },
                )),
            Container(
              padding: const EdgeInsets.all(35),
              color: Colors.blue[200],
              child: Consumer<MyModel>(
                builder: (context, myModel, child) {
                  return Text(myModel.someValue);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<MyModel> someAsyncFunctionToGetMyModel() async {
  await Future.delayed(const Duration(seconds: 3));
  return MyModel(someValue: 'new data');
}

class MyModel {
  MyModel({required this.someValue});

  String someValue = '';

  Future<void> doSomething() async {
    await Future.delayed(const Duration(seconds: 2));
    someValue = 'Goodbye';
    print(someValue);
  }
}
