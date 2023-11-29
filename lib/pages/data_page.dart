import 'package:flutter/material.dart';
import 'package:foodex/components/bargraph/bar_graph.dart';
import 'package:foodex/components/my_button.dart';
import 'package:foodex/components/piechart.dart';
import 'package:foodex/pages/planning_page.dart';
import 'package:foodex/components/square_tile.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  List<double> weeklySummary = [
    100.20,
    80.59,
    72.42,
    70.50,
    62.20,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: SingleChildScrollView(
        // Wrap with SingleChildScrollView
        child: Center(
          child: Column(
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Tus estadísticas',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFf2f2f2)),
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
                      builder: (context) => PlanningPage(),
                    ),
                  );
                },
                buttonText: "Planificar comida",
              ),
              const SizedBox(height: 20),
              const Text("Producción Semanal",
                  style: TextStyle(
                    color: Color(0xff2B2C40),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  )),
              const SizedBox(height: 10),
              SizedBox(
                height: 250,
                child: MyBarGraph(
                  weeklySummary: weeklySummary,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Porcentaje de Residuos",
                style: TextStyle(
                  color: Color(0xff2B2C40),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 250,
                child: MyPieChart(),
              ),
              const SizedBox(height: 30),
              const Text("Consumo según día",
                  style: TextStyle(
                    color: Color(0xff2B2C40),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  )),
              const SquareTile(imagePath: 'lib/images/consumido_dia.jpeg'),

              const SizedBox(height: 30),
              const Text("Consumo según tipo",
                  style: TextStyle(
                    color: Color(0xff2B2C40),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  )),

              const SquareTile(imagePath: 'lib/images/consumido_tipo.jpeg'),

              const SizedBox(height: 30),
              const Text("Datos por tipo de comida",
                  style: TextStyle(
                    color: Color(0xff2B2C40),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  )),

              const SquareTile(imagePath: 'lib/images/coc_rest_comida.jpeg'),

              const SizedBox(height: 30),
              const Text("Restante vs cocinado según comida",
                  style: TextStyle(
                    color: Color(0xff2B2C40),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  )),

              const SquareTile(imagePath: 'lib/images/coc_rest_tipo.jpeg'),


            ],
          ),
        ),
      ),
    );
  }
}
