part of 'fd_bloc.dart';

class FdState extends Equatable {
  final double fd;

  const FdState({required this.fd});

  @override
  List<Object> get props => [fd];

  Map<String, dynamic> toMap() {
    return {
      "fd": fd,
    };
  }

  factory FdState.fromMap(Map<String, dynamic> map) {
    return FdState(
      fd: map["fd"].toDouble() ?? 0,
    );
  }
}

class FdInitial extends FdState {
  const FdInitial() : super(fd: 0);
}

class FdCalculationState extends FdState {
  const FdCalculationState(double fd) : super(fd: fd);
}
