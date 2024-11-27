part of 'machinery_map_bloc.dart';

@immutable
sealed class MachineryMapState {}

final class MachineryMapLoading extends MachineryMapState {}
final class MachineryMapLoaded extends MachineryMapState {
  final List<MachineList> machineListMap;

  GoogleMapController? mapController;
  CameraPosition? initialCameraPosition;
  Set<Marker> markers = {};
  String? currentAddress;

  MachineryMapLoaded({
    required this.machineListMap,
    this.mapController,
    this.initialCameraPosition,
    this.markers = const {},
    this.currentAddress,
});

  MachineryMapLoaded copyWith({
    List<MachineList>? machineListMap,
  }) {
    return MachineryMapLoaded(
      machineListMap: machineListMap ?? this.machineListMap,
    );
  }



}
