import 'package:flutter/material.dart';
import 'package:foodex/components/my_button.dart';
import 'data_page.dart';
import 'registry_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataPage(),
                    ),
                  );
                },
                buttonText: "Revisar estadísticas"),
            const SizedBox(height: 50),
            MyButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegistryPage(),
                    ),
                  );
                },
                buttonText: "Ingresar datos"),
          ],
        ),
      ),
    );
  }
}
