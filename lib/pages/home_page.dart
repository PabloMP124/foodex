import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:foodex/components/my_button.dart';
import 'package:foodex/components/square_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFB2E9A5)),
              borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
              ),
              color: const Color(0xFFB2E9A5),
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 3 / 5,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Gestiona tu casino y olvida las sobras',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFf2f2f2)),
                    textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                SquareTile(imagePath: 'lib/images/logo.png'),
              ],
            ),
          ),
          const SizedBox(height: 100),
          MyButton(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOutQuart;

                    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);

                    return SlideTransition(position: offsetAnimation, child: child);
                  },
                  transitionDuration: const Duration(milliseconds: 800),
                ),
              );
            },
            buttonText: "Ingresar",
          )

        ],
      ),
    );
  }
}
