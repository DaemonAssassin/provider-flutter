import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build');
    var counter = Provider.of<ValueNotifier<int>>(context, listen: false);
    return Scaffold(
      body: Center(
        child: Consumer<ValueNotifier<int>>(
          builder:
              (BuildContext context, ValueNotifier<int> model, Widget? child) {
            return Text(
              '${model.value}',
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
        onPressed: () {
          counter.value++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
