import 'package:foodex/components/bargraph/Individual_bar.dart';

class BarData {
  final double monAmount;
  final double tweAmount;
  final double wedAmount;
  final double thuAmount;
  final double friAmount;

  BarData({
    required this.monAmount,
    required this.tweAmount,
    required this.wedAmount,
    required this.thuAmount,
    required this.friAmount,
  });

  List<IndividualBar> barData = [];

  void initializeBarData() {
    barData = [
      // monday
      IndividualBar(x: 0, y: monAmount),
      // twesday
      IndividualBar(x: 1, y: tweAmount),
      // wednesday
      IndividualBar(x: 2, y: wedAmount),
      // thursday
      IndividualBar(x: 3, y: thuAmount),
      // friday
      IndividualBar(x: 4, y: friAmount),
    ];
  }
}
