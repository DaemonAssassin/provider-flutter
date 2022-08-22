import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider 1/routes/home.dart';
import 'Provider 2/screens/home_screen_2.dart';

void main(List<String> args) {
  runApp(
    // ChangeNotifierProvider<User>(
    //   create: (context) => User(),
    //   child: const ProviderApp1(),
    // ),
    // ChangeNotifierProvider<Counter>(
    //   create: (_) => Counter(),
    //   child: const ProviderApp2(),
    // ),
    ChangeNotifierProvider<ValueNotifier<int>>(
      create: (_) => ValueNotifier<int>(0),
      child: const ProviderApp2(),
    ),
  );
}

class ProviderApp1 extends StatelessWidget {
  const ProviderApp1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
      },
    );
  }
}

class ProviderApp2 extends StatelessWidget {
  const ProviderApp2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen2(),
    );
  }
}
