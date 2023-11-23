import 'package:flutter/material.dart';
import 'package:foodex/components/my_button.dart';
import 'data_page.dart';
import 'registry_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF9AA7B1)),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: const Color(0xFF9AA7B1),
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 1 / 5,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Menu de administrador',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFf2f2f2),
                      ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
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
