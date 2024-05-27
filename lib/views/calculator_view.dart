import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/calculator_controller.dart';

class CalculatorView extends StatelessWidget {
  final CalculatorController controller = Get.put(CalculatorController());

  CalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Calculadora GetX'),
        elevation: 5,
        shadowColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        child: Column(
          children: [
            // Mostra o resultado do cálculo
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.centerRight,
                child: Obx(() => Text(
                      controller.display.value,
                      style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    )),
              ),
            ),
            const SizedBox(height: 16), // Espaço entre o display e os botões
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  buildButtonRow(['7', '8', '9', '/']),
                  const SizedBox(height: 8), // Espaço entre as linhas de botões
                  buildButtonRow(['4', '5', '6', '*']),
                  const SizedBox(height: 8),
                  buildButtonRow(['1', '2', '3', '-']),
                  const SizedBox(height: 8),
                  buildButtonRow(['C', '0', '=', '+']),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButtonRow(List<String> buttons) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons.map((button) {
          return Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: Colors.white24,
                padding: const EdgeInsets.symmetric(vertical: 24),
              ),
              child: Text(button,
                  style: const TextStyle(fontSize: 24, color: Colors.white)),
              onPressed: () => controller.input(button),
            ),
          );
        }).toList(),
      ),
    );
  }
}
