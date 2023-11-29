import 'dart:math';
import 'package:flutter/material.dart';
import 'package:foodex/components/my_button.dart';

class Dish {
  final String name;

  Dish(this.name);
}

class PlanningPage extends StatefulWidget {
  @override
  _PlanningPageState createState() => _PlanningPageState();
}

class _PlanningPageState extends State<PlanningPage> {
  List<Dish> allDishes = [
    Dish('Lentejas guisadas'),
    Dish('Pollo a la plancha'),
    Dish('Pavo al horno'),
    Dish('Arroz'),
    Dish('Papas rusticas'),
    Dish('Fideos'),
    Dish('Pepino'),
    Dish('Lechuga tomate'),
    Dish('Repollo'),
    Dish('Budin de verduras'),
    Dish('Aji de gallina'),
    Dish('Bastones de merluza'),
    Dish('Papas a las finas'),
    Dish('Papas al eneldo'),
    Dish('Pepino espinaca'),
    Dish('Repollo brocoli'),
    Dish('Garbanzos guisados'),
    Dish('Pollo asado'),
    Dish('Asado alemán'),
    Dish('Arroz al curry'),
    Dish('Pasta napolitana'),
    Dish('Papas al merken'),
    Dish('Tortilla española'),
    Dish('Vacuno arvejado'),
    Dish('Pure'),
    Dish('Pasta a la mantequilla'),
  ];

  List<Dish> selectedDishes = [];
  Map<Dish, int> dishQuantities = {};

  bool isListVisible = false; // Initially set to false

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: Column(
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
            height: MediaQuery.of(context).size.height * 1 / 6,
            child: const Center(
              child: Text(
                'Planificación',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFf2f2f2),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            title: Text('Platos'),
            onTap: () {
              setState(() {
                isListVisible = !isListVisible;
              });
            },
          ),
          Visibility(
            visible: isListVisible,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              height: MediaQuery.of(context).size.height * 1 / 3,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: allDishes.length,
                itemBuilder: (context, index) {
                  final dish = allDishes[index];
                  return ListTile(
                    title: Text(dish.name),
                    onTap: () {
                      setState(() {
                        if (selectedDishes.contains(dish)) {
                          selectedDishes.remove(dish);
                        } else {
                          selectedDishes.add(dish);
                        }
                      });
                    },
                    tileColor:
                        selectedDishes.contains(dish) ? Colors.blue : null,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          MyButton(
            onTap: () {
              // Generate random values for selected dishes
              _showBarGraph();
              // Clear the selected dishes
              setState(() {
                selectedDishes.clear();
              });

              // Hide the list after generating bar graph
              setState(() {
                isListVisible = false;
              });
            },
            buttonText: 'Generar planificación',
          ),
          SizedBox(height: 20), // Adjust the spacing as needed
        ],
      ),
    );
  }

  void _showBarGraph() {
    // Clear the selected dishes and quantities
    dishQuantities.clear();

    int targetSum = 150;

    // If no dishes are selected, do nothing
    if (selectedDishes.isEmpty) {
      return;
    }

    // Calculate the remaining target sum after assigning a base value to each selected dish
    int baseQuantity = targetSum ~/ selectedDishes.length;
    int remainingSum = targetSum % selectedDishes.length;

    // Assign the base quantity to each selected dish
    for (var dish in selectedDishes) {
      dishQuantities[dish] = baseQuantity;
    }

    // Distribute the remaining quantity randomly among the selected dishes
    for (var i = 0; i < remainingSum; i++) {
      var dish = selectedDishes[Random().nextInt(selectedDishes.length)];
      dishQuantities[dish] = dishQuantities[dish]! + 1;
    }

    List<Widget> dishQuantitiesText = [];
    for (var dish in dishQuantities.keys) {
      int quantity = dishQuantities[dish] ?? 0;
      dishQuantitiesText.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text('${dish.name}: $quantity kg'),
        ),
      );
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Kilos necesarios'),
                SizedBox(height: 10),
                ...dishQuantitiesText,
                SizedBox(height: 10),
                MyButton(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  buttonText: 'Cerrar',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

