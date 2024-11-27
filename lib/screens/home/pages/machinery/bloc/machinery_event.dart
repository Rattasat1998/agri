part of 'machinery_bloc.dart';

@immutable
sealed class MachineryEvent {}

class MachineryInitialEvent extends MachineryEvent {}

class MachineryGetMachineryByIdEvent extends MachineryEvent {
  final String id;

  MachineryGetMachineryByIdEvent({required this.id});
}

class MachineryGetObjectiveListEvent extends MachineryEvent {}

class GetInformationEvent extends MachineryEvent {
  final String machineryId;

  GetInformationEvent({required this.machineryId});
}