import 'package:agri/screens/machinery_map/bloc/machinery_map_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MachineryMapScreen extends StatefulWidget {
  const MachineryMapScreen({super.key});

  @override
  State<MachineryMapScreen> createState() => _MachineryMapScreenState();
}

class _MachineryMapScreenState extends State<MachineryMapScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<MachineryMapBloc>().add(GetMachineryMap(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MachineryMapBloc, MachineryMapState>(
        builder: (context, state) {
          if (state is MachineryMapLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is MachineryMapLoaded) {
            return GoogleMap(
              initialCameraPosition: state.initialCameraPosition!,
              // indoorViewEnabled: true,
              mapType: MapType.normal,
              zoomControlsEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                state.mapController = controller;
              },
              markers: state.markers,

            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
