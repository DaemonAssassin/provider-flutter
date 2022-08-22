import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureProvider<String>(
        create: (context) => getPackageUpdate(),
        initialData: 'OTTP code running',
        catchError: (BuildContext context, Object? error) {
          return 'Package activation failed';
        },
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
    String status = Provider.of<String>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          status,
          style: const TextStyle(
            fontSize: 48.0,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),
      ),
    );
  }
}

Future<String> getPackageUpdate() async {
  return await Future.delayed(
    const Duration(seconds: 3),
    () => 'Packages Added Successfully',
  );
}
