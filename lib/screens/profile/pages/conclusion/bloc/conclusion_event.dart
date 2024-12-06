part of 'conclusion_bloc.dart';

@immutable
sealed class ConclusionEvent {}

class ConclusionInitialFamilyEvent extends ConclusionEvent {}

class ConclusionInitialSystemRiceEvent extends ConclusionEvent {}
