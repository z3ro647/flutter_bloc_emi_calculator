import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc_emi_calculator/bloc/emi_bloc.dart';
import 'package:my_bloc_emi_calculator/bloc/fd_bloc.dart';
import 'package:my_bloc_emi_calculator/screen/emi_screen.dart';
import 'package:my_bloc_emi_calculator/screen/fd_screen.dart';

void main() {
  runApp(const MyBloc());
}

class MyBloc extends StatelessWidget {
  const MyBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EmiBloc>(
          create: (BuildContext context) => EmiBloc(),
        ),
        BlocProvider<FdBloc>(
          create: (BuildContext context) => FdBloc(),
        ),
      ],
      child: const MyApp(),
    );
    // return BlocProvider(
    //   create: (BuildContext context) => EmiBloc(),
    //   child: const MyApp(),
    // );
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
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EMI & FD Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EmiScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Emi Screen',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FdScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Fd Screen',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
