part of 'conclusion_bloc.dart';

 class ConclusionState {
   final FamilyInfoModel? familyInfoModel;
   final SystemRiceInfoModel? systemRiceModel;
   final bool isLoading ;

   ConclusionState({
     this.familyInfoModel,
     this.systemRiceModel,
      this.isLoading = false,

   });

   ConclusionState copyWith({
     FamilyInfoModel? familyInfoModel,
     SystemRiceInfoModel? systemRiceModel,
      bool? isLoading,
   }) {
     return ConclusionState(
       familyInfoModel: familyInfoModel ?? this.familyInfoModel,
       systemRiceModel: systemRiceModel ?? this.systemRiceModel,
        isLoading: isLoading ?? this.isLoading,
     );
   }
 }

