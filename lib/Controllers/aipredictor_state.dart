part of 'aipredictor_cubit.dart';

@immutable
abstract class AipredictorState {}

class AipredictorInitial extends AipredictorState {}

class AIPredictorLoading extends AipredictorState {}

class AIPredictorLoaded extends AipredictorState {
  final int prediction;

  AIPredictorLoaded(this.prediction);
}

class AIPredictorError extends AipredictorState {
  final String message;

  AIPredictorError(this.message);
}
