import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerProvider {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> photoPicker() async {
    final photo = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 100, maxWidth: 800, maxHeight: 800);
    return photo;
  }

  Future<XFile?> cameraPicker() async {
    final photo = await _picker.pickImage(source: ImageSource.camera, imageQuality: 100, maxWidth: 800, maxHeight: 800);
    return photo;
  }

  Future<CroppedFile?> cropPhoto({
    required BuildContext context,
    required XFile photo,
  }) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: photo.path,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 100,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
          rectHeight: 200,
          rectWidth: 200,
        ),
        WebUiSettings(
          context: context,
          presentStyle: CropperPresentStyle.page,
          boundary: const CroppieBoundary(
            width: 520,
            height: 200,
          ),
          viewPort: const CroppieViewPort(width: 480, height: 200, type: 'circle'),
          enableExif: true,
          enableZoom: true,
          showZoomer: true,
        ),
      ],
    );
    return croppedFile;
  }

  showImageSelectionModal({
    required BuildContext context,
    required Function()? photo,
    required Function()? camera,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('รูปภาพ'),
                onTap: photo,
                trailing: Icon(Icons.image),
              ),
              ListTile(
                title: Text('กล้อง'),
                onTap: camera,
                trailing: Icon(Icons.camera_alt),
              ),
              SizedBox(height: 50),
            ],
          ),
        );
      },
    );
  }
}
