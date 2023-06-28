import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'emi_event.dart';
part 'emi_state.dart';

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
