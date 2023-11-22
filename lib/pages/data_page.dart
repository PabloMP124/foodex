import 'package:flutter/material.dart';
import 'package:foodex/components/bargraph/bar_graph.dart';

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
      body: Center(
        child: Column (
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
                    'Tus estadísticas',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFf2f2f2)),
                      textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              "Eficiencia Semanal",
              style: TextStyle( 
                color: Color(0xff2B2C40),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              )
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 250,
              child: MyBarGraph(
                weeklySummary: weeklySummary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
