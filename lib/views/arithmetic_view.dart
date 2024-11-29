import 'package:flutter/material.dart';

class ArithmeticView extends StatefulWidget {
  const ArithmeticView({Key? key}) : super(key: key);

  @override
  _ArithmeticViewState createState() => _ArithmeticViewState();
}

class _ArithmeticViewState extends State<ArithmeticView> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String result = '';
  String error = '';

  void calculateArithmetic(String operation) {
    if (_formKey.currentState!.validate()) {
      final double num1 = double.tryParse(num1Controller.text) ?? 0;
      final double num2 = double.tryParse(num2Controller.text) ?? 0;
      double tempResult = 0;

      setState(() {
        error = '';

        if (operation == 'add') {
          tempResult = num1 + num2;
        } else if (operation == 'subtract') {
          tempResult = num1 - num2;
        } else if (operation == 'multiply') {
          tempResult = num1 * num2;
        } else if (operation == 'divide') {
          if (num2 == 0) {
            error = 'Cannot divide by zero!';
            return;
          } else {
            tempResult = num1 / num2;
          }
        }

        result = 'Result: ${tempResult.toStringAsFixed(2)}';
      });
    } else {
      setState(() {
        result = '';
        error = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Enter two numbers to perform arithmetic operations',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: num1Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Number 1',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the first number';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: num2Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Number 2',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the second number';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => calculateArithmetic('add'),
                      child: const Text('Add'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => calculateArithmetic('subtract'),
                      child: const Text('Subtract'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => calculateArithmetic('multiply'),
                      child: const Text('Multiply'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => calculateArithmetic('divide'),
                      child: const Text('Divide'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (error.isNotEmpty)
                Text(
                  error,
                  style: const TextStyle(fontSize: 18, color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              if (result.isNotEmpty)
                Text(
                  result,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
