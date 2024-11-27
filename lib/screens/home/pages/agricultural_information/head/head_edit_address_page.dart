import 'dart:io';

import 'package:agri/screens/home/pages/agricultural_information/bloc/agricultural_information_bloc.dart';
import 'package:agri/screens/home/pages/agricultural_information/head/models/group_head_address_model.dart';
import 'package:agri/screens/home/pages/agricultural_information/widgets/tabs/tab1.dart';
import 'package:agri/utils/image_picker_providers.dart';
import 'package:agri/utils/image_provider.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_dialog.dart';
import 'package:agri/widgets/custom_model.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:agri/widgets/custom_text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../utils/custom_google_map_widget.dart';
import '../repository/agricultural_repository.dart';
import '../widgets/tabs/tabbar_bloc.dart';
import 'models/head_google_map.dart';

class HeadEditAddressPage extends StatefulWidget {
  final GroupHeadAddressModelData headAddress;

  const HeadEditAddressPage({super.key, required this.headAddress});

  @override
  State<HeadEditAddressPage> createState() => _HeadEditAddressPageState();
}

class _HeadEditAddressPageState extends State<HeadEditAddressPage> {
  final AgriculturalRepository _agriculturalRepository = AgriculturalRepository();
  bool mapLoading = false;
  late Position position;
  LatLng? initialCameraPosition;
  Set<Marker>? markers;
  String? currentAddress;
  late GoogleMapController _controller;

  void _onMapCreated(GoogleMapController controller) async {
   setState(() {
     _controller = controller;
     mapLoading = true;
     init();
   });
  }
  void _onCameraMove(CameraPosition position) async {
    print('Move Camera');
    setState(() {
      // print(currentAddress);
      initialCameraPosition = position.target;
      markers = {
        Marker(
          markerId: const MarkerId('1'),
          position: initialCameraPosition ?? const LatLng(0, 0),
        )
      };
      _controller.animateCamera(CameraUpdate.newCameraPosition(position));
    });
  }
  void init() async {
    setState(() {
      initialCameraPosition = LatLng(
        double.parse(widget.headAddress.group!.latitude.toString()),
        double.parse(widget.headAddress.group!.longitude.toString()),
      );

      markers = {
        Marker(
          markerId: const MarkerId('1'),
          position: initialCameraPosition ?? const LatLng(0, 0),
        )
      };
      _controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: initialCameraPosition ?? const LatLng(0, 0),
          zoom: 15,
        ),
      ));
      //await Future.delayed(const Duration(seconds: 3));
      mapLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButtonWidget(color: Color(0xff206102)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder<AgriculturalInformationBloc, AgriculturalInformationState>(
        builder: (context, state) {
          if (state is AgriculturalInformationLoaded) {
            return ListView(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: CustomText(
                    text: 'แก้ไขข้อมูลกลุ่ม',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff103300),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xff9ABC95),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          state.headGroupImageFile != null
                              ? SizedBox(
                                  width: 250,
                                  height: 150,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      File(state.headGroupImageFile!.path),
                                      width: 200,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: SizedBox(
                                    width: 250,
                                    height: 150,
                                    child: Image.network(
                                      widget.headAddress.group!.groupImg!,
                                      width: 250,
                                      height: 150,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) => Center(
                                        child: Image.network(
                                          'https://cdn.pixabay.com/photo/2020/05/28/02/21/plowing-5229573_1280.jpg',
                                          width: 250,
                                          height: 150,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  )),
                          const SizedBox(width: 10),
                          CupertinoButton(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                            color: const Color(0xff0F2E00),
                            child: const CustomText(
                              text: 'เปลี่ยน',
                              color: Colors.white,
                            ),
                            onPressed: () {
                              //
                              CustomModal().showModal(
                                  context: context,
                                  child: Column(
                                    children: [
                                      const CustomText(
                                        text: 'เลือกรูปภาพจาก',
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      const SizedBox(height: 16),
                                      ListTile(
                                        title: const CustomText(
                                          text: 'รูปภาพ',
                                          fontSize: 18,
                                          textAlign: TextAlign.start,
                                        ),
                                        onTap: () async {
                                          Get.back();
                                          XFile? file = await ImagePickerProvider().photoPicker();
                                          if (file != null) {
                                            context
                                                .read<AgriculturalInformationBloc>()
                                                .add(HeadChangeImageEvent(img: file));
                                          }
                                        },
                                        trailing: const Icon(Icons.image),
                                      ),
                                      const Divider(),
                                      ListTile(
                                        title: const CustomText(
                                          text: 'กล้อง',
                                          fontSize: 18,
                                          textAlign: TextAlign.start,
                                        ),
                                        onTap: () async {
                                          Get.back();
                                          XFile? file = await ImagePickerProvider().cameraPicker();
                                          if (file != null) {
                                            context
                                                .read<AgriculturalInformationBloc>()
                                                .add(HeadChangeImageEvent(img: file));
                                          }
                                        },
                                        trailing: const Icon(Icons.camera_alt),
                                      ),
                                      const SizedBox(height: 16),
                                    ],
                                  ));
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const CustomText(text: 'ชื่อกลุ่มเกษตรกร'),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: CustomTextFieldWidget(
                          placeHolder: 'กลุ่มเกษตรกรนาแปลงใหญ่ที่ 1',
                          controller: state.headGroupNameController,
                          validator: (value) => null,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const CustomText(text: 'ที่ตั้ง'),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: CustomTextFieldWidget(
                          placeHolder: 'ที่ตั้ง',
                          controller: state.headGroupAddressController,
                          validator: (value) => null,
                          maxLine: 3,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const CustomText(text: 'ความเป็นมา'),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: CustomTextFieldWidget(
                          placeHolder: 'ความเป็นมาของกลุ่มเกษตรกรนาแปลงใหญ่ที่ 1',
                          controller: state.headGroupDescriptionController,
                          validator: (value) => null,
                          maxLine: 16,
                        ),
                      ),
                      const SizedBox(height: 16),
                      mapLoading
                          ? CupertinoActivityIndicator()
                          : CustomGoogleMapWidget(
                        height: 180,
                        onMapCreated: _onMapCreated,
                        initialCameraPosition: CameraPosition(
                          target:
                          initialCameraPosition ?? const LatLng(0, 0),
                          zoom: 15,
                        ),
                        markers: markers ?? const {},
                        onTap: (latLng) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HeadGoogleMap(
                                    initialCameraPosition:
                                    CameraPosition(
                                      target: initialCameraPosition ??
                                          const LatLng(0, 0),
                                      zoom: 15,
                                    ),
                                    //xw onCameraMove: _onCameraMove,
                                    onCameraMove: _onCameraMove,
                                    //currentAddress: currentAddress ?? '',
                                  )));
                          /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HeadGoogleMap(
                                    initialCameraPosition:
                                    CameraPosition(
                                      target: initialCameraPosition ??
                                          const LatLng(0, 0),
                                      zoom: 15,
                                    ),
                                    //xw onCameraMove: _onCameraMove,
                                    onCameraMove: _onCameraMove,
                                    //currentAddress: currentAddress ?? '',
                                  )));*/
                        },
                        //onCameraMove: _onCameraMove,
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: CupertinoButton(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                            color: const Color(0xff0F2E00),
                            child: const CustomText(
                              text: 'บันทึก',
                              color: Colors.white,
                            ),
                            onPressed: () async {
                              /*context
                                  .read<AgriculturalInformationBloc>()
                                  .add(HeadSubmitEvent(context: context));*/
                              try {
                                final groupName = state.headGroupNameController.text;
                                final groupAddress = state.headGroupAddressController.text;
                                final description = state.headGroupDescriptionController.text;
                                final image = state.headGroupImageFile;
                                final gh = state.groupHeadAddressModel;
                                EasyLoading.show(status: 'กำลังโหลด');
                                final response =
                                    await _agriculturalRepository.headUpdateGroupInformation(
                                  name: groupName,
                                  address: groupAddress,
                                  description: description,
                                  image: image?.path ?? '',
                                  lat: initialCameraPosition?.latitude ?? 0.0,
                                  lng: initialCameraPosition?.longitude ?? 0.0,
                                  tel: gh?.data?.group?.groupTel ?? '',
                                );
                                if (response['result']) {

                                  final a = await _agriculturalRepository.getAgriculturalAddress();
                                  final gh =
                                      await _agriculturalRepository.getHeadAgriculturalAddress();
                                  final agriculturalInformation =
                                      await _agriculturalRepository.getAgriculturalInformation();
                                  state.groupHeadAddressModel = gh;
                                  state.groupAddressModel = a;
                                  state.groupInformationModel = agriculturalInformation;
                                  EasyLoading.dismiss();
                                  CustomDialog.showCustomDialog(
                                    context: context,
                                    title: '',
                                    description: response['message'],
                                    icon: Image.asset(ImageProviders.success),
                                    onPressed: () {
                                      setState(() {});
                                      Get.back();
                                      Navigator.pop(context,a.data!.groupData!);

                                    },
                                  );
                                } else {}
                              } catch (e, t) {
                                print(e);
                                print(t);
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
