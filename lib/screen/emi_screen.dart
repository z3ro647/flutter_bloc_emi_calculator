import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc_emi_calculator/bloc/emi_bloc.dart';

class EmiScreen extends StatelessWidget {
  const EmiScreen({super.key});

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
                context.read<EmiBloc>().add(
                      EmiCalculationEvent(
                        principle: double.parse(principle.text),
                        rate: double.parse(rate.text),
                        months: double.parse(months.text),
                      ),
                    );
              },
              child: const Text('Calculate'),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<EmiBloc, EmiState>(
              builder: ((context, state) {
                return Text(
                  '${state.emi}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
