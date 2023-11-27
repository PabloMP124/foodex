import 'package:flutter/material.dart';

import "package:foodex/components/my_button.dart";

class RegistryPage extends StatefulWidget {
  @override
  _RegistryPageState createState() => _RegistryPageState();
}

class _RegistryPageState extends State<RegistryPage> {
  // Map to store production and excess values for each dish
  Map<String, Map<String, double>> dishValues = {};

  // Controller for text fields
  TextEditingController productionController = TextEditingController();
  TextEditingController excessController = TextEditingController();

  // Function to update values in the map
  void updateValues(String dish, {double? production, double? excess}) {
    setState(() {
      // Get the existing values for the dish
      Map<String, double> existingValues = dishValues[dish] ?? {'production': 0.0, 'excess': 0.0};

      // Update only the provided values
      if (production != null) {
        existingValues['production'] = production;
      }

      if (excess != null) {
        existingValues['excess'] = excess;
      }

      // Update the map with the modified values
      dishValues[dish] = existingValues;
    });
  }


 Widget buildProductionForm() {
    return Column(
      children: [
        // Add text field for production
        TextField(
          controller: productionController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'Producción'),
        ),
        // Add a button to submit the production value
        const SizedBox(height: 50),
        MyButton(
          onTap: () {
            // Get the selected dish
            String selectedDish = dishDropdownValue;

            // Get production value from the text field
            double production = double.parse(productionController.text);

            // Update production value in the map
            updateValues(selectedDish, production: production);

            // Clear the production text field
            productionController.clear();
          },
          buttonText: "Guardar Producción",
        ),
      ],
    );
  }

  Widget buildExcessForm() {
    return Column(
      children: [
        // Add text field for excess
        TextField(
          controller: excessController,
          keyboardType: TextInputType.numberWithOptions(signed: true),
          // Allow negative numbers
          decoration: InputDecoration(labelText: 'Residuo o falta'),
        ),
        // Add a button to submit the excess value
        const SizedBox(height: 50),
        MyButton(
          onTap: () {
            // Get the selected dish
            String selectedDish = dishDropdownValue;

            // Get excess value from the text field
            double excess = double.parse(excessController.text);

            // Update excess value in the map
            updateValues(selectedDish, excess: excess);

            // Clear the excess text field
            excessController.clear();
          },
          buttonText: "Guardar Exceso",
        ),
      ],
    );
  }
  // Dropdown menu items for dishes
  List<String> dishes = [
    'Lentejas guisadas',
    'Pollo a la plancha',
    'Pavo al horno',
    'Arroz',
    'Papas rusticas',
    'Fideos',
    'Pepino',
    'Lechuga tomate',
    'Repollo',
    'Budin de verduras',
    'Aji de gallina',
    'Bastones de merluza',
    'Papas a las finas',
    'Papas al eneldo',
    'Pepino espinaca',
    'Repollo brocoli',
    'Garbanzos guisados',
    'Pollo asado',
    'Asado alemán',
    'Arroz al curry',
    'Pasta napolitana',
    'Papas al merken',
    'Tortilla española',
    'Vacuno arvejado',
    'Pure',
    'Pasta a la mantequilla'
    // Extra dishes
  ];

  // Variable to store the selected dish from the dropdown
  String dishDropdownValue = 'Lentejas guisadas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: SingleChildScrollView(
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
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ingresa los datos diarios',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFf2f2f2)),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
            // Dropdown menu for selecting a dish
            DropdownButton<String>(
              value: dishDropdownValue,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    dishDropdownValue = newValue;
                  });
                }
              },
              items: dishes.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: Text('Select a dish'),
            ),
            // Display the form
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: buildProductionForm(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: buildExcessForm(),
            ),
            // Display the stored values
            const SizedBox(height: 50),
            Text('Has registrado: \n${getFormattedValues()}'),
          ],
        ),
      ),
    );
  }

  String getFormattedValues() {
    return dishValues.entries.map((entry) {
      String dish = entry.key;
      double production = entry.value['production'] ?? 0.0;
      double excess = entry.value['excess'] ?? 0.0;

      return '$dish: (Producción: $production, Exceso: $excess)\n';
    }).join('');
  }
}

