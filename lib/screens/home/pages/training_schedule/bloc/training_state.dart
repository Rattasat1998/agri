part of 'training_bloc.dart';

@immutable
abstract class TrainingState {}

class TrainingLoading extends TrainingState {}

class TrainingLoaded extends TrainingState {
  final TrainingModel trainingModel;
  final TrainingDetailModel? trainingDetailModel;
  final bool isTrainingLoading;
  final bool isRegisterLoading ;
   bool isLoading ;
  final bool isLoadEdit ;
  final DateTime selectedDate;
  final LogoModel? logo;
   LogoList? selectedLogo;
  final TextEditingController trainingNameController;
  final TextEditingController trainingDetailController;
  DateTime? date;
  DateTime? time;
   String? trainingId;

  TrainingLoaded({
    required this.trainingModel,
    this.trainingDetailModel,
    required this.isTrainingLoading,
     this.isRegisterLoading = false,
     this.isLoading = false,
    required this.selectedDate,
    this.logo,
    this.selectedLogo,
    this.isLoadEdit = false,
    required this.trainingNameController,
    required this.trainingDetailController,
    this.date,
    this.time,
    this.trainingId,
  });

  TrainingLoaded copyWith({
    TrainingModel? trainingModel,
    TrainingDetailModel? trainingDetailModel,
    bool? isTrainingLoading,
    bool? isRegisterLoading,
    DateTime? selectedDate,
    bool? isLoading,
    bool? isLoadEdit,
    LogoModel? logo,
    LogoList? selectedLogo,
    TextEditingController? trainingNameController,
    TextEditingController? trainingDetailController,
    DateTime? date,
    DateTime? time,
    String? trainingId,
  }) {
    return TrainingLoaded(
      trainingModel: trainingModel ?? this.trainingModel,
      trainingDetailModel: trainingDetailModel ?? this.trainingDetailModel,
      isTrainingLoading: isTrainingLoading ?? this.isTrainingLoading,
      isRegisterLoading: isRegisterLoading ?? this.isRegisterLoading,
      selectedDate: selectedDate ?? this.selectedDate,
      isLoading: isLoading ?? this.isLoading,
      logo: logo ?? this.logo,
      selectedLogo: selectedLogo ?? this.selectedLogo,
      isLoadEdit: isLoadEdit ?? this.isLoadEdit,
      trainingNameController: trainingNameController ?? this.trainingNameController,
      trainingDetailController: trainingDetailController ?? this.trainingDetailController,
      date: date ?? this.date,
      time: time ?? this.time,
      trainingId: trainingId ?? this.trainingId,
    );
  }
}
