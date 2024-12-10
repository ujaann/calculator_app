import 'package:calculator_app/common/calculator_button.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  final TextEditingController data=TextEditingController(text: "0");
  final List<String> buttonText=[
    "C","*","/","<-","1","2","3","+","4","5","6","-","7","8","9","*","%","0",".","="
 ];
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("Calculator App"),),
      body: Column(
        children: [
          TextField(
            controller: data,
            textDirection: TextDirection.rtl,
            style: const TextStyle(fontSize: 26),
            decoration: const InputDecoration(
              border: OutlineInputBorder()
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: GridView.count(crossAxisCount: 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            children: [
              for(String i in buttonText)...{
                CalculatorButton(text: i, onTap: () {},)
              }
            ],),
          ),
        ],
      ),
    );
  }
}
