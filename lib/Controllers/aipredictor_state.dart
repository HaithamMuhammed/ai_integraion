part of 'aipredictor_cubit.dart';

@immutable
abstract class AIPredictorState {}

class AIPredictorInitial extends AIPredictorState {}

class AIPredictorLoading extends AIPredictorState {}

class AIPredictorLoaded extends AIPredictorState {
  final int prediction;

  AIPredictorLoaded(this.prediction);
}

class AIPredictorError extends AIPredictorState {
  final String message;

  AIPredictorError(this.message);
}
