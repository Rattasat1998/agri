part of 'machinery_bloc.dart';

@immutable
sealed class MachineryState {}

final class MachineryLoading extends MachineryState {}

final class MachineryLoaded extends MachineryState {
  final MachineryModel machineryModel;
  final MachineryDetailModel? machineryDetailModel;
  final bool isDetailLoading;
  final ObjectivesModel? objectiveList;
  final MachineryInfoModel? machineryInfoModel;


  MachineryLoaded({
    required this.machineryModel,
     this.machineryDetailModel,
    this.isDetailLoading = false,
    this.objectiveList,
    this.machineryInfoModel,
  });

  MachineryLoaded copyWith({
    MachineryModel? machineryModel,
    MachineryDetailModel? machineryDetailModel,
    bool? isDetailLoading,
    ObjectivesModel? objectiveList,
    MachineryInfoModel? machineryInfoModel,
  }) {
    return MachineryLoaded(
      machineryModel: machineryModel ?? this.machineryModel,
      machineryDetailModel: machineryDetailModel ?? this.machineryDetailModel,
      objectiveList: objectiveList ?? this.objectiveList,
      isDetailLoading: isDetailLoading ?? this.isDetailLoading,
      machineryInfoModel: machineryInfoModel ?? this.machineryInfoModel,
    );
  }
}
