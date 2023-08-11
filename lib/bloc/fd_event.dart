part of 'fd_bloc.dart';

abstract class FdEvent {}

class FdCalculationEvent extends FdEvent {
  late double principle, rate, years;
  FdCalculationEvent({
    required this.principle,
    required this.rate,
    required this.years,
  });
}
