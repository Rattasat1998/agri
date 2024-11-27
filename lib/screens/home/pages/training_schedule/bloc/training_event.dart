part of 'training_bloc.dart';

@immutable
abstract class TrainingEvent {}

class TrainingInitialEvent extends TrainingEvent {}

class GetTrainingByDateEvent extends TrainingEvent {
  final String date;

  GetTrainingByDateEvent({required this.date});
}

class GetTrainingByIdEvent extends TrainingEvent {
  final String id;

  GetTrainingByIdEvent({required this.id});
}

class RegisterTrainingEvent extends TrainingEvent {
  final String id;
  final BuildContext context;

  RegisterTrainingEvent({
    required this.id,
    required this.context,
  });
}

class TrainingSelectedDateEvent extends TrainingEvent {
  final DateTime date;

  TrainingSelectedDateEvent({required this.date});
}

class TrainingSearchDateEvent extends TrainingEvent {}

class TrainingDeleteEvent extends TrainingEvent {
  final String id;

  TrainingDeleteEvent({required this.id});
}

class TrainingGetLogoEvent extends TrainingEvent {}

class TrainingOnSelectedLogoEvent extends TrainingEvent {
  final LogoList logo;

  TrainingOnSelectedLogoEvent({required this.logo});
}

class ResetAddEditTrainingEvent extends TrainingEvent {}

class TrainingDateChangeEvent extends TrainingEvent {
  final DateTime date;

  TrainingDateChangeEvent({required this.date});
}

class TrainingTimeChangeEvent extends TrainingEvent {
  final DateTime time;

  TrainingTimeChangeEvent({required this.time});
}

class TrainingSubmitEvent extends TrainingEvent {
  final bool isEdit;
  final String? trainingId;
  final BuildContext context;

  TrainingSubmitEvent({
    required this.isEdit,
    this.trainingId,
    required this.context,
  });
}

class TrainingSetValuesEvent extends TrainingEvent {
  final Train trainingModel;

  TrainingSetValuesEvent({
    required this.trainingModel,
  });
}
