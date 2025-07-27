import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_ai_project/Services/AI_services.dart';

part 'aipredictor_state.dart';

class AIPredictorCubit extends Cubit<AIPredictorState> {
  AIPredictorCubit() : super(AIPredictorInitial());

  Future<void> predictTennis(List<int> features) async {
    emit(AIPredictorLoading());

    try {
      final prediction = await AIService().predictTennis(features);

      if (prediction != null) {
        emit(AIPredictorLoaded(prediction));
      } else {
        emit(AIPredictorError("Failed to get prediction from the model."));
      }
    } catch (e) {
      emit(AIPredictorError("Something went wrong: ${e.toString()}"));
    }
  }
}
