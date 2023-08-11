import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fd_event.dart';
part 'fd_state.dart';

// The fixed deposit calculator for simple interest FD uses the following formula –
// M = P + (P x r x t/100), where –
// P is the principal amount that you deposit
// r is the rate of interest per annum
// t is the tenure in years
// For example, if you deposit a sum of Rs. 1,00,000 for 5 years at 10% interest, the equation reads –
// M= Rs. 1,00,000 + (1,00,000 x 10 x 5/100)
// = Rs. 1,50,000

class FdBloc extends Bloc<FdEvent, FdState> {
  FdBloc() : super(const FdInitial()) {
    on<FdCalculationEvent>(((event, emit) {
      double r = 0, fd = 0, sum = 0, years = 0, principle = 0, divideby = 0;
      r = event.rate;
      years = event.years;
      principle = event.principle;
      divideby = years / 100;
      sum = principle * r * divideby;
      fd = principle + sum;
      debugPrint("R value: $r");
      debugPrint("Sum value: $sum");
      debugPrint("Time value: $divideby");
      debugPrint(fd.toString());
      emit(FdCalculationState(fd));
    }));
  }
}
