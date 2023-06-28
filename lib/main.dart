import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc_emi_calculator/bloc/emi_bloc.dart';
import 'package:my_bloc_emi_calculator/screen/emi_screen.dart';

void main() {
  runApp(const MyBloc());
}

class MyBloc extends StatelessWidget {
  const MyBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => EmiBloc(),
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EmiScreen(),
    );
  }
}
