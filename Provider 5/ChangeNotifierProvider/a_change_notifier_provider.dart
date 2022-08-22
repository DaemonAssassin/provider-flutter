// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //! ChangeNotifierProvider<T>
    return ChangeNotifierProvider<MyModel>(
      create: (context) => MyModel(),
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
              child: Builder(
                builder: (context) {
                  //! Getting model instance from Provider using context
                  //! without listening to changes.
                  MyModel myModel =
                      Provider.of<MyModel>(context, listen: false);
                  return RaisedButton(
                    child: const Text('Do something'),
                    onPressed: () {
                      myModel.doSomething();
                    },
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(35),
              color: Colors.blue[200],
              child: Consumer<MyModel>(
                builder: (context, myModel, child) {
                  print('consumer');
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

//! Model
class MyModel with ChangeNotifier {
  String someValue = 'Hello';

  void doSomething() {
    someValue = 'Goodbye';
    notifyListeners();
  }
}
