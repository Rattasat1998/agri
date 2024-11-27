import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  // Constants for error messages
  static const String locationServicesDisabledError =
      'Location services are disabled.';
  static const String locationPermissionDeniedError =
      'Location permissions are denied.';
  static const String locationPermissionDeniedForeverError =
      'Location permissions are permanently denied, we cannot request permissions.';

  // Check if the user has location permission
  Future<bool> hasLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  // Request location permission
  Future<void> requestLocationPermission() async {



    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      throw Exception(locationServicesDisabledError);
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception(locationPermissionDeniedError);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(locationPermissionDeniedForeverError);
    }
  }

  // Check if the user should show request permission rationale
  Future<bool> shouldShowRequestPermissionRationale() async {
    // Implement your logic here
    return true;
  }

  // Open the app settings
  Future<void> openAppSettings() async {
    // Implement opening app settings
  }

  // Open the permission settings
  Future<void> openPermissionSettings() async {
    // Implement opening permission settings
  }

  // Open the permission settings for the app
  Future<void> openPermissionSettingsForApp() async {
    // Implement opening permission settings for the app
  }

  // Open the permission settings for location
  Future<void> openPermissionSettingsForLocation() async {
    // Implement opening permission settings for location
  }

  // Open the permission settings for camera
  Future<void> openPermissionSettingsForCamera() async {
    // Implement opening permission settings for camera
  }
}
