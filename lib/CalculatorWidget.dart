// ignore_for_file: library_private_types_in_public_api

// Importing the material.dart package which contains Flutter widgets.
import 'package:flutter/material.dart';

// Define a stateful widget named CalculatorWidget.
class CalculatorWidget extends StatefulWidget {
  const CalculatorWidget({super.key}); // Constructor for CalculatorWidget.

  @override
  _CalculatorState createState() =>
      _CalculatorState(); // Create state for the widget.
}

// Define the state for CalculatorWidget.
class _CalculatorState extends State<CalculatorWidget> {
  String output =
      "0"; // Variable to hold the output displayed on the calculator.
  String _output = "0"; // Internal variable to track output.
  double num1 = 0.0; // Variable to hold the first operand.
  double num2 = 0.0; // Variable to hold the second operand.
  String operand = ""; // Variable to hold the operator (+, -, *, /).

  // Function to handle button presses.
  buttonPressed(String buttonText) {
    // Clear all variables if "C" (clear) button is pressed.
    if (buttonText == "C") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    }
    // Set the operator if one of the operator buttons is pressed.
    else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "*") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    }
    // Handle decimal input.
    else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("decimals present");
        return;
      } else {
        _output = _output + buttonText;
      }
    }
    // Perform calculation when "=" button is pressed.
    else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "*") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    }
    // Handle numeric input.
    else {
      _output = _output + buttonText;
    }

    // Update the output and re-render the widget.
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  // Function to build calculator buttons.
  Widget buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.all(22.0),
            backgroundColor: const Color.fromARGB(333, 265, 77, 52),
          ),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 252),
            ),
          ),
        ),
      ),
    );
  }

  // Build the UI for the CalculatorWidget.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: const Text("Calculator"), // You can add a title here if needed.
          ),
      body: Column(
        children: <Widget>[
          // Display the output at the top.
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 12.0,
            ),
            child: Text(output,
                style: const TextStyle(
                    fontSize: 48.0, fontWeight: FontWeight.bold)),
          ),
          const Expanded(
            child: Divider(), // Add a divider for visual separation.
          ),
          // Build rows of buttons for the calculator.
          Column(children: [
            Row(children: [
              buildButton("7"),
              buildButton("8"),
              buildButton("9"),
              buildButton("/"),
            ]),
            Row(children: [
              buildButton("4"),
              buildButton("5"),
              buildButton("6"),
              buildButton("*"),
            ]),
            Row(children: [
              buildButton("1"),
              buildButton("2"),
              buildButton("3"),
              buildButton("-"),
            ]),
            Row(children: [
              buildButton("."),
              buildButton("0"),
              buildButton("00"),
              buildButton("+"),
            ]),
            Row(children: [
              buildButton("C"),
              buildButton("="),
            ]),
          ])
        ],
      ),
    );
  }
}
