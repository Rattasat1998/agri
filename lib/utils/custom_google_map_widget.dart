import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMapWidget extends StatelessWidget {
  final Function(GoogleMapController)? onMapCreated;
  final Set<Marker> markers;
  final CameraPosition initialCameraPosition;
  final double? height;
  final MapType mapType;
  final Function(LatLng)? onTap;
  final Function(CameraPosition)? onCameraMove;
  final Function()? onCameraIdle;
  final bool scrollGesturesEnabled;
  const CustomGoogleMapWidget({
    super.key,
    required this.onMapCreated,
    required this.initialCameraPosition,
    this.markers = const {},
    this.height,
    this.mapType = MapType.hybrid,
    this.onTap,
    this.scrollGesturesEnabled = true,
    this.onCameraMove,
    this.onCameraIdle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? MediaQuery.of(context).size.height,
      child: GoogleMap(
        mapType: mapType,
        scrollGesturesEnabled: scrollGesturesEnabled,
        initialCameraPosition: initialCameraPosition,
        onMapCreated: onMapCreated,
        markers: markers,
        myLocationButtonEnabled: false,
        onTap: onTap,
        onCameraMove: onCameraMove,
        onCameraIdle: onCameraIdle,
      ),
    );
  }
}
