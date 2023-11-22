import 'package:flutter/material.dart';
import 'package:foodex/components/my_button.dart';

class RegistryPage extends StatelessWidget {
  const RegistryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Menu Page!',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            MyButton(
                onTap: () {},
                buttonText: "Sos",
                ),
            const SizedBox(height: 50),
            MyButton(onTap: () {}, buttonText: "Sus"),
          ],
        ),
      ),
    );
  }
}
