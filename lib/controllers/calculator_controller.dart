import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var display = '0'.obs;
  var firstOperand = '';
  var secondOperand = '';
  var operator = '';

  void input(String value) {
    if (value == 'C') {
      clear();
    } else if (value == '+' || value == '-' || value == '*' || value == '/') {
      if (firstOperand.isEmpty) {
        firstOperand = display.value;
        operator = value;
        display.value = '0';
      } else if (operator.isEmpty) {
        operator = value;
      } else {
        operator = value;
      }
    } else if (value == '=') {
      if (firstOperand.isNotEmpty && operator.isNotEmpty) {
        secondOperand = display.value;
        calculate();
      }
    } else {
      if (display.value == '0') {
        display.value = value;
      } else {
        display.value += value;
      }
    }
  }

  void calculate() {
    double num1 = double.parse(firstOperand);
    double num2 = double.parse(secondOperand);
    double result;

    switch (operator) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '*':
        result = num1 * num2;
        break;
      case '/':
        result = num1 / num2;
        break;
      default:
        result = 0;
        break;
    }

    // Arredondamento para números que terminam em zero
    if (result.toString().endsWith('.0')) {
      display.value = result.toInt().toString();
    } else {
      display.value = result.toString();
    }

    firstOperand = '';
    secondOperand = '';
    operator = '';
  }

  void clear() {
    display.value = '0';
    firstOperand = '';
    secondOperand = '';
    operator = '';
  }
}
