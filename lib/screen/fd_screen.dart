import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc_emi_calculator/bloc/fd_bloc.dart';

class FdScreen extends StatelessWidget {
  const FdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController principle = TextEditingController(text: '100000');
    TextEditingController rate = TextEditingController(text: '10');
    TextEditingController years = TextEditingController(text: '5');
    return Scaffold(
      appBar: AppBar(
        title: const Text('FD Calculator'),
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
              controller: years,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Years',
                hintText: 'Enter duration in Years',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<FdBloc>().add(
                      FdCalculationEvent(
                        principle: double.parse(principle.text),
                        rate: double.parse(rate.text),
                        years: double.parse(years.text),
                      ),
                    );
              },
              child: const Text('Calculate'),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<FdBloc, FdState>(
              builder: ((context, state) {
                return Text(
                  //'${state.emi.toStringAsFixed(2)}',
                  state.fd.toStringAsFixed(2),
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
