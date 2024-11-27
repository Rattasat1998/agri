import 'package:agri/screens/home/pages/machinery/bloc/machinery_bloc.dart';
import 'package:agri/screens/home/pages/machinery/models/machinery_model.dart';
import 'package:agri/screens/machinery_map/models/machinery_map_model.dart';
import 'package:agri/screens/machinery_map/repository/machinery_map_repository.dart';
import 'package:agri/widgets/custom_machinery_card_widget.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../utils/app_routers.dart';

part 'machinery_map_event.dart';

part 'machinery_map_state.dart';

class MachineryMapBloc extends Bloc<MachineryMapEvent, MachineryMapState> {
  final MachineryMapRepository _machineryMapRepository = MachineryMapRepository();

  MachineryMapBloc() : super(MachineryMapLoading()) {
    on<GetMachineryMap>(_onGetMachineryMap);
  }

  void _onGetMachineryMap(GetMachineryMap event, Emitter<MachineryMapState> emit) async {
    final context = event.context;
    try {
      emit(MachineryMapLoading());
      final MachineryMapModel machineryMap = await _machineryMapRepository.getMachineryMap();
      Position position = await locationPermissionStatus();
      const lat = 16.0409525;
      const lng = 103.6683498;
      final List<MachineList> machineListMap = machineryMap.data!.machineListMaps;
      print('Machine List Map: ${machineListMap.map((e) => e.machineName)}');
      emit(MachineryMapLoaded(
        machineListMap: machineListMap,
        initialCameraPosition: const CameraPosition(
          target: LatLng(lat, lng),
          zoom: 10.0,
        ),
        markers: _buildMarkers(context, machineListMap),
      ));
    } catch (e) {
      print(e);
    }
  }

  Set<Marker> _buildMarkers(BuildContext context, List<MachineList> machineListMap) {
    Set<Marker> markers = {}; // Initialize an empty set of markers
    for (int i = 0; i < machineListMap.length; i++) {
      MachineList machine = machineListMap[i];
      print('machine $i: ${machine.machineName}');
      BitmapDescriptor markerIcon;
      switch (machine.machineStatus) {
        case 1:
          markerIcon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);
          break;
        case 2:
          markerIcon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow);
          break;
        case 3:
          markerIcon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
          break;
        default:
          markerIcon = BitmapDescriptor.defaultMarker;
      }

      // Create a closure to capture the current machine data
      Marker marker = Marker(
        icon: markerIcon,
        markerId: MarkerId(machine.machineId.toString()),
        position: LatLng(double.parse(machine.lat ?? '0.0'), double.parse(machine.lng ?? '0.0')),
        infoWindow: InfoWindow(
          title: machine.machineName,
          snippet: machine.message,
        ),
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return SafeArea(
                child: Builder(
                  builder: (context) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        CustomMachineryCardWidget(
                          machineImg: machine.machineImg!,
                          machineName: machine.machineName!,
                          groupName: machine.groupName!,
                          message: machine.message!,
                          user: machine.user!,
                          borrowingCount: machine.borrowingCount!,
                          numberFields: machine.numberFields!,
                          onPressed: () {
                            context.read<MachineryBloc>().add(
                              MachineryGetMachineryByIdEvent(
                                id: machine.machineId.toString(),
                              ),
                            );
                            Navigator.pushNamed(
                              context,
                              AppRoutes.machineryDetailPage,
                              arguments: machine,
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          );
        },
      );

      markers.add(marker); // Add the created marker to the set
    }
    return markers;
  }


  final permissionLocation = Permission.location;
  Future<Position> locationPermissionStatus() async {
    // Request location permission
    final status = await permissionLocation.request();
    await [Permission.locationAlways, Permission.locationWhenInUse].request();
    if (status == PermissionStatus.granted) {
      // Get the current location
      final position = await Geolocator.getCurrentPosition();
      print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
      return position;
    } else {
      // If the user denied the permission

      // Permission denied
      print('Location permission denied.');
      Position position = await _determinePosition();
      return position;
      //  return Future.error('Location permission denied.');
    }
  }


  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
