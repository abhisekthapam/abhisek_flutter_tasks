import 'package:flutter/material.dart';

class SimpleInterestView extends StatefulWidget {
  const SimpleInterestView({Key? key}) : super(key: key);

  @override
  _SimpleInterestViewState createState() => _SimpleInterestViewState();
}

class _SimpleInterestViewState extends State<SimpleInterestView> {
  final TextEditingController principalController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String result = '';

  void calculateSimpleInterest() {
    if (_formKey.currentState!.validate()) {
      final double principal = double.tryParse(principalController.text) ?? 0;
      final double rate = double.tryParse(rateController.text) ?? 0;
      final double time = double.tryParse(timeController.text) ?? 0;

      final double simpleInterest = (principal * rate * time) / 100;

      setState(() {
        result = 'Simple Interest: \Rs.${simpleInterest.toStringAsFixed(2)}';
      });
    } else {
      setState(() {
        result = '';
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
              const SizedBox(height: 10),
              const Text(
                'Enter the values to calculate Simple Interest',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: principalController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Principal (P)',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the principal amount';
                  }
                  if (double.tryParse(value) == null ||
                      double.tryParse(value)! <= 0) {
                    return 'Please enter a valid number greater than 0';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: rateController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Rate of Interest (R)',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the rate of interest';
                  }
                  if (double.tryParse(value) == null ||
                      double.tryParse(value)! <= 0) {
                    return 'Please enter a valid number greater than 0';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: timeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Time Period (T)',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the time period';
                  }
                  if (double.tryParse(value) == null ||
                      double.tryParse(value)! <= 0) {
                    return 'Please enter a valid number greater than 0';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: calculateSimpleInterest,
                child: const Text('Calculate'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
