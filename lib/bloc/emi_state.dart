part of 'emi_bloc.dart';

class EmiState extends Equatable {
  final double emi;

  const EmiState({required this.emi});

  @override
  List<Object> get props => [emi];

  Map<String, dynamic> toMap() {
    return {
      "emi": emi,
    };
  }

  factory EmiState.fromMap(Map<String, dynamic> map) {
    return EmiState(
      emi: map["emi"].toDouble() ?? 0,
    );
  }
}

class EmiInitial extends EmiState {
  const EmiInitial() : super(emi: 0);
}

class EmiCalculationState extends EmiState {
  const EmiCalculationState(double emi) : super(emi: emi);
}
