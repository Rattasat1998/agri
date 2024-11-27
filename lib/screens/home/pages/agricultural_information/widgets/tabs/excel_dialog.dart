import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ExcelDialog extends StatefulWidget {
  final Map address;
  final bool isLoading;
  final void Function(GoogleMapController)? onMapCreated;
  final Future<void> Function()? downloadExcel;
  final Set<Marker> markers;

  const ExcelDialog({
    super.key,
    required this.address,
    required this.isLoading,
    required this.onMapCreated,
    required this.downloadExcel,
    required this.markers,
  });

  @override
  State<ExcelDialog> createState() => _ExcelDialogState();
}

class _ExcelDialogState extends State<ExcelDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('ดาวน์โหลดไฟล์ Excel'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 300,
            child: GoogleMap(
                markers: widget.markers,
                initialCameraPosition: CameraPosition(
                    target: LatLng(widget.address['latitude'], widget.address['longitude']), zoom: 14),
                onMapCreated: widget.onMapCreated),
          ),
          widget.isLoading
              ? const CupertinoActivityIndicator()
              : const Text('คุณต้องการดาวน์โหลดไฟล์ Excel ใช่หรือไม่?'),
        ],
      ),
      actions: [
        TextButton(
          onPressed:  widget.downloadExcel,
          child: const Text('ตกลง'),
        ),
      ],
    );
    ;
  }
}
