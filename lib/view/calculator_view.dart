import 'package:calculator_app/common/calculator_button.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  final TextEditingController data = TextEditingController(text: "0");
  final List<String> buttonText = [
    "C",
    "*",
    "/",
    "<-",
    "1",
    "2",
    "3",
    "+",
    "4",
    "5",
    "6",
    "-",
    "7",
    "8",
    "9",
    "*",
    "%",
    "0",
    ".",
    "="
  ];
  String first = "0";
  String second = "0";
  String operator = "";

  String calculate() {
    String? error;
    double? result;
    switch (operator) {
      case "+":
        result = double.tryParse(first)! + double.tryParse(second)!;
        break;
      case "-":
        result = double.tryParse(first)! - double.tryParse(second)!;
        break;
      case "*":
        result = double.tryParse(first)! * double.tryParse(second)!;
        break;
      case "/":
        final v1 = double.tryParse(first);
        final v2 = double.tryParse(second);
        if (v2 == 0) {
          error = "Error";
          break;
        }
        result = v1! / v2!;
        break;

      default:
    }
    return error ?? (result ?? "").toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              // enabled: false,
              controller: data,
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 26, letterSpacing: 2),
              decoration: const InputDecoration(border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
                child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: buttonText.length,
              itemBuilder: (context, index) {
                String buttonData = buttonText[index];
                return CalculatorButton(
                    text: buttonData,
                    onTap: () {
                      double? input = double.tryParse(buttonData);
                      if (input == null) {
                        switch (buttonData) {
                          case "C":
                            first = "0";
                            second = "0";
                            operator = "";
                            data.text = "0";

                            break;
                          case "<-":
                            if (data.text.isEmpty) {
                              return;
                            }
                            data.text =
                                data.text.substring(0, data.text.length - 1);
                            if (operator.isEmpty) {
                              first = data.text.endsWith(".")
                                  ? data.text.substring(0, data.text.length - 1)
                                  : data.text;
                            }

                            break;
                          case ".":
                            if (data.text.contains(".")) {
                              break;
                            }

                            data.text = "${data.text}.";

                            break;
                          case "*":
                            operator = "*";
                            break;
                          case "/":
                            operator = "/";
                            break;
                          case "-":
                            operator = "-";
                            break;
                          case "+":
                            operator = "+";
                            break;
                          case "%":
                            String result =
                                (double.tryParse(first)! / 100).toString();
                            first = result;
                            data.text = result;
                            break;
                          case "=":
                            String result = calculate();
                            data.text = result;
                            first = result;
                            second = "0";
                            operator = "";
                            break;
                        }
                      } else {
                        if (operator.isEmpty) {
                          first = first == "0"
                              ? buttonData
                              : data.text + buttonData;
                          data.text = first;
                        } else {
                          second = second == "0"
                              ? buttonData
                              : data.text + buttonData;
                          data.text = second;
                        }
                      }
                    });
              },
            )),
          ],
        ),
      ),
    );
  }
}
