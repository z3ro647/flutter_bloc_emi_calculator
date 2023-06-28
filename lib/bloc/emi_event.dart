part of 'emi_bloc.dart';

abstract class EmiEvent {}

class EmiInitialEvent extends EmiEvent {}

class EmiCalculationEvent extends EmiEvent {
  late double principle, rate, months;
  EmiCalculationEvent({
    required this.principle,
    required this.rate,
    required this.months,
  });
}
