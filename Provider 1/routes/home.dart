import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Provider 1")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Consumer<User>(
            builder: (BuildContext context, User user, Widget? child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildText(user),
                  const SizedBox(height: 24),
                  _buildTextField(user),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  TextField _buildTextField(User user) {
    return TextField(
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onChanged: (String? input) {
        if (input != null && input.isNotEmpty) {
          user.checkEligibility(int.parse(input));
        }
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Enter age',
      ),
    );
  }

  Text _buildText(User user) {
    return Text(
      user.message,
      style: TextStyle(
        fontSize: 48.0,
        fontWeight: FontWeight.bold,
        color: user.isEligible ? Colors.green : Colors.red,
      ),
    );
  }
}
