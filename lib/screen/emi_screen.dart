// ignore_for_file: avoid_print

import 'dart:math';

import 'package:flutter/material.dart';

class EmiScreen extends StatefulWidget {
  const EmiScreen({super.key});

  @override
  State<EmiScreen> createState() => _EmiScreenState();
}

class _EmiScreenState extends State<EmiScreen> {
  double r = 0, emi = 0, upperValue = 0, lowerValue = 0;
  double amount = 0;

  @override
  Widget build(BuildContext context) {
    TextEditingController principle = TextEditingController(text: '3000000');
    TextEditingController rate = TextEditingController(text: '14');
    TextEditingController months = TextEditingController(text: '120');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emi Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: principle,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Principle',
                hintText: 'Enter Principle Amount',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: rate,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Rate',
                hintText: 'Enter Rate %',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: months,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Months',
                hintText: 'Enter duration in Months',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                //double r, emi, upperValue, lowerValue;
                r = double.parse(rate.text) / 12;
                r = r / 100;
                final powerValue = pow(1 + r, int.parse(months.text));
                upperValue = r * powerValue;
                lowerValue = powerValue - 1;
                emi = double.parse(principle.text) * upperValue / lowerValue;
                print("R value: $r");
                print("Power value: $powerValue");
                print("upper value: $upperValue");
                print("lower value: $lowerValue");
                print(emi);
                setState(() {
                  amount = emi;
                });
              },
              child: const Text('Calculate'),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Amount : $amount",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
