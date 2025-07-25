import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_ai_project/Services/AI_services.dart';


part 'aipredictor_state.dart';

class AipredictorCubit extends Cubit<AipredictorState> {
  AipredictorCubit() : super(AipredictorInitial());

  Future<void> predictTennis(List<int> features) async {
    emit(AIPredictorLoading());

    try {
      final prediction = await AIService().predictTennis(features);

      if (prediction == null) {
        emit(AIPredictorError("Failed to get prediction from the model."));
      } else {
        emit(AIPredictorLoaded(prediction));
      }
    } catch (e) {
      emit(AIPredictorError("Something went wrong: $e"));
    }
  }
}
