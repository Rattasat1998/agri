import 'package:agri/screens/profile/pages/conclusion/models/family_info_model.dart';
import 'package:agri/screens/profile/pages/conclusion/models/system_rice_info_model.dart';
import 'package:agri/screens/profile/pages/conclusion/repository/conclusion_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'conclusion_event.dart';
part 'conclusion_state.dart';

class ConclusionBloc extends Bloc<ConclusionEvent, ConclusionState> {

  final ConclusionRepository _conclusionRepository = ConclusionRepository();

  ConclusionBloc() : super(ConclusionState()) {
    on<ConclusionInitialFamilyEvent>(_onInitial);
    on<ConclusionInitialSystemRiceEvent>(_onInitialSystemRice);
  }

  void _onInitialSystemRice(ConclusionInitialSystemRiceEvent event, Emitter<ConclusionState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final systemRiceModel = await _conclusionRepository.getInfoConclusion();
      emit(state.copyWith(systemRiceModel: systemRiceModel, isLoading: false));
    } catch (e,t) {
      print(e);
      print(t);
      // emit(ConclusionError());
    }
  }

  void _onInitial(ConclusionInitialFamilyEvent event, Emitter<ConclusionState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final familyInfoModel = await _conclusionRepository.getInfoIntroduction();
      emit(state.copyWith(familyInfoModel: familyInfoModel, isLoading: false));
    } catch (e,t) {
      print(e);
      print(t);
      // emit(ConclusionError());
    }
  }

}
