part of 'machinery_borrow_bloc.dart';

class MachineryBorrowState {
   Objective? objective;
   DateTime? startDate;
   DateTime? endDate;
   bool? isLoading;
  final TextEditingController numberFields;
  final TextEditingController description;
    PageController? pageController ;

  MachineryBorrowState({
    this.objective,
    this.startDate,
    this.endDate,
    required this.description,
    this.isLoading = false,
    required this.numberFields,
     this.pageController,
  });

  MachineryBorrowState copyWith({
    Objective? objective,
    DateTime? startDate,
    DateTime? endDate,
    bool? isLoading,
    TextEditingController? description,
    TextEditingController? numberFields,
    PageController? pageController,
  }) {
    return MachineryBorrowState(
      objective: objective ?? this.objective,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      description: description ?? this.description,
      isLoading: isLoading ?? this.isLoading,
      numberFields: numberFields ?? this.numberFields,
      pageController: pageController ?? this.pageController,
    );
  }
}

