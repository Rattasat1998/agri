part of 'machinery_borrow_bloc.dart';

@immutable
sealed class MachineryBorrowEvent {}

class BorrowInitialEvent extends MachineryBorrowEvent {}

class BorrowChangedStartDateEvent extends MachineryBorrowEvent {
  final DateTime? startDate;

  BorrowChangedStartDateEvent({required this.startDate});
}

class BorrowChangedEndDateEvent extends MachineryBorrowEvent {
  final DateTime? endDate;

  BorrowChangedEndDateEvent({required this.endDate});
}

class BorrowChangedObjectiveEvent extends MachineryBorrowEvent {
  final Objective objective;

  BorrowChangedObjectiveEvent({required this.objective});
}



class BorrowConfirmEvent extends MachineryBorrowEvent {
  final String machineryId;
  final BuildContext context;

  BorrowConfirmEvent({
    required this.machineryId,
    required this.context,
  });
}
