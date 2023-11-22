import 'package:flutter/material.dart';
import 'package:foodex/components/my_button.dart';

class DataPage extends StatelessWidget {
  const DataPage({super.key});

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
                buttonText: "Sas",
                ),
            const SizedBox(height: 50),
            MyButton(onTap: () {}, buttonText: "SEs"),
          ],
        ),
      ),
    );
  }
}
