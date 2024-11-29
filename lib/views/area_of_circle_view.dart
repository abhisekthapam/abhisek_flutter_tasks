import 'package:flutter/material.dart';
import 'dart:math';

class AreaOfCircleView extends StatefulWidget {
  const AreaOfCircleView({Key? key}) : super(key: key);

  @override
  _AreaOfCircleViewState createState() => _AreaOfCircleViewState();
}

class _AreaOfCircleViewState extends State<AreaOfCircleView> {
  final TextEditingController radiusController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String result = '';

  void calculateAreaOfCircle() {
    if (_formKey.currentState!.validate()) {
      final double radius = double.tryParse(radiusController.text) ?? 0;

      final double area = pi * radius * radius;

      setState(() {
        result = 'Area of Circle: ${area.toStringAsFixed(2)}';
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
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Enter the radius to calculate Area of Circle',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: radiusController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Radius (r)',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the radius';
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
                onPressed: calculateAreaOfCircle,
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
