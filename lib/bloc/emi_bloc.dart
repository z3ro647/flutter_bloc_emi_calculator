import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'emi_event.dart';
part 'emi_state.dart';

// EMI calculators also work on the basis of this formula:
// EMI = [P x R x (1+R)^N]/[(1+R)^N-1].
// R represents ‘rate of interest’.
// P denotes your principal amount.
// N indicates the loan tenure. It is the time within which you must repay the loan amount.
// Example P = 30,00,000, R = 14%, N = 10 Years
// N = 10 Years = 120 Months
// R = 14% = 14/12/100 = 0.011666666666666667
// EMI = Rs 30,00,000 * 0.0116 * (1 + 0.0116)^120 / ((1 + 0.0116)^120 - 1)
// EMI = 46579.93

class EmiBloc extends Bloc<EmiEvent, EmiState> {
  EmiBloc() : super(const EmiInitial()) {
    on<EmiCalculationEvent>((event, emit) {
      double r = 0, emi = 0, upperValue = 0, lowerValue = 0;
      r = event.rate / 12;
      r = r / 100;
      final powerValue = pow(1 + r, event.months);
      upperValue = r * powerValue;
      lowerValue = powerValue - 1;
      emi = event.principle * upperValue / lowerValue;
      debugPrint("R value: $r");
      debugPrint("Power value: $powerValue");
      debugPrint("upper value: $upperValue");
      debugPrint("lower value: $lowerValue");
      debugPrint(emi.toString());
      emit(EmiCalculationState(emi));
    });
  }
}
