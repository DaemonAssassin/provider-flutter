// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //! MultiProviders
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyModel>(
          create: (context) => MyModel(),
        ),
        //! ProxyProvider<T, R> -> R depend on T
        ProxyProvider<MyModel, AnotherModel>(
          update: (context, myModel, anotherModel) => AnotherModel(myModel),
        ),
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('My App')),
          body: Column(
            children: <Widget>[
              Row(
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
                              myModel.doSomething('Goodbye');
                            },
                          );
                        },
                      )),
                  Container(
                    padding: const EdgeInsets.all(35),
                    color: Colors.blue[200],
                    //! Consumer<T>
                    child: Consumer<MyModel>(
                      builder: (context, myModel, child) {
                        return Text(myModel.someValue);
                      },
                    ),
                  ),
                ],
              ),
              Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.red[200],
                  //! Consumer<R>
                  child: Consumer<AnotherModel>(
                    builder: (context, anotherModel, child) {
                      return RaisedButton(
                        child: const Text('Do something else'),
                        onPressed: () {
                          anotherModel.doSomethingElse();
                        },
                      );
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

//! Model (T)
class MyModel with ChangeNotifier {
  String someValue = 'Hello';
  void doSomething(String value) {
    someValue = value;
    notifyListeners();
  }
}

//! Model (R)
class AnotherModel {
  AnotherModel(this._myModel);
  final MyModel _myModel;
  void doSomethingElse() {
    _myModel.doSomething('See you later');
  }
}
