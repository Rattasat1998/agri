import 'dart:io';
import 'package:agri/screens/home/pages/agricultural_information/bloc/agricultural_information_bloc.dart';
import 'package:agri/screens/home/pages/agricultural_information/head/models/head_google_map.dart';
import 'package:agri/screens/home/pages/agricultural_information/models/group_machine_model.dart';
import 'package:agri/utils/custom_google_map_widget.dart';
import 'package:agri/utils/image_picker_providers.dart';
import 'package:agri/utils/image_provider.dart';
import 'package:agri/utils/themes.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_dialog.dart';
import 'package:agri/widgets/custom_model.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:agri/widgets/custom_text_field_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../models/group_machine_type_model.dart';
import '../models/group_member_model.dart';
import '../repository/agricultural_repository.dart';

class HeadAddEditMachineryPage extends StatefulWidget {
  final bool isEdit;
  final GroupMachineModelDataMachine? machine;

  const HeadAddEditMachineryPage({super.key, this.isEdit = false, this.machine});

  @override
  State<HeadAddEditMachineryPage> createState() => _HeadAddEditMachineryPageState();
}

class _HeadAddEditMachineryPageState extends State<HeadAddEditMachineryPage> {
  final _formKey = GlobalKey<FormState>();
  final AgriculturalRepository _agriculturalRepository = AgriculturalRepository();
  bool mapLoading = false;
  late Position position;
  LatLng? initialCameraPosition;
  Set<Marker>? markers;
  String? currentAddress;

  late GoogleMapController _controller;

  void _onMapCreated(GoogleMapController controller) async {
    position = await Geolocator.getCurrentPosition();
    setState(() {
      _controller = controller;
      mapLoading = true;
      if (widget.isEdit) {
        init();
      } else {
        initialCameraPosition = LatLng(position.latitude, position.longitude);
        markers = {
          Marker(
            markerId: const MarkerId('1'),
            position: initialCameraPosition ?? const LatLng(0, 0),
            onTap: () {
              // _onMarkerTapped(const MarkerId('1'));
            },
          )
        };
        mapLoading = false;
        _controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
            target: initialCameraPosition ?? const LatLng(0, 0),
            zoom: 15,
          ),
        ));
      }
    });
    try {} catch (e, t) {
      print(e);
      print(t);
    }
  }

  /*  void _initialCameraPosition() async {
    try {
      position = await Geolocator.getCurrentPosition();
      print(position.latitude);
      setState(() {
        initialCameraPosition = LatLng(position.latitude, position.longitude);
        markers = {
          Marker(
            markerId: const MarkerId('1'),
            position: initialCameraPosition,
            onTap: () {
              _onMarkerTapped(const MarkerId('1'));
            },
          )
        };
        _controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
            target: initialCameraPosition,
            zoom: 15,
          ),
        ));

        mapLoading = false;
      });
    } catch (e, t) {
      print(e);
      print(t);
    }
  }*/

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

  Future<String?> getAddressFromLocation(LatLng latLng) async {
    // From coordinates
    List<Placemark> placemarks = await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    Placemark place = placemarks[0];
    return place.name;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // init();
    // mapLoading = true;
  }

  void init() async {
    setState(() {
      initialCameraPosition = widget.machine != null
          ? LatLng(double.parse(widget.machine!.lat.toString()),
              double.parse(widget.machine!.lng.toString()))
          : const LatLng(0, 0);
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
    Color primaryColor = const Color(0xffC5DFC3);
    Color primaryColorGreen = const Color(0xff206102);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: mapLoading
          ? CircularProgressIndicator.adaptive()
          : Scaffold(
              backgroundColor: primaryColor,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: 80,
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: const BackButtonWidget(),
              ),
              body: BlocBuilder<AgriculturalInformationBloc, AgriculturalInformationState>(
                builder: (context, state) {
                  if (state is AgriculturalInformationLoaded) {
                    final users = state.groupMemberHeadModel!.data!.members;
                    final types = state.machineTypeModel!.data!.machineType;

                    var currentImage = state.headGroupImagePath;
                    return state.isEditing
                        ? const Center(child: CircularProgressIndicator.adaptive())
                        : ListView(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: CustomText(
                                  text: widget.isEdit ? 'แก้ไขเครื่องจักร' : 'เพิ่มเครื่องจักร',
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xff303030),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.all(30),
                                  margin: const EdgeInsets.symmetric(horizontal: 8),
                                  child: Form(
                                    key: _formKey,
                                    child: Column(
                                      children: [
                                        _buildNameWidget(state),
                                        const SizedBox(height: 10),
                                        _buildGroupDropDownWidget(context, types, state),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                // context.read<AgriculturalInformationBloc>().add(HeadChangeImageEvent());
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
                                                            XFile? file =
                                                                await ImagePickerProvider()
                                                                    .photoPicker();
                                                            if (file != null) {
                                                              context
                                                                  .read<
                                                                      AgriculturalInformationBloc>()
                                                                  .add(
                                                                      BorrowAgriculturalChangeImageEvent(
                                                                          img: file));
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
                                                            XFile? file =
                                                                await ImagePickerProvider()
                                                                    .cameraPicker();
                                                            if (file != null) {
                                                              context
                                                                  .read<
                                                                      AgriculturalInformationBloc>()
                                                                  .add(HeadChangeImageEvent(
                                                                      img: file));
                                                            }
                                                          },
                                                          trailing: const Icon(Icons.camera_alt),
                                                        ),
                                                        const SizedBox(height: 16),
                                                      ],
                                                    ));
                                              },
                                              child: Container(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 30, vertical: 10),
                                                decoration: BoxDecoration(
                                                  color: primaryColorGreen,
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                                child: Image.asset(
                                                  ImageProviders.photo,
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            state.borrowGroupImageFile != null
                                                ? ClipRRect(
                                                    borderRadius: BorderRadius.circular(8),
                                                    child: Image.file(
                                                      File(state.borrowGroupImageFile!.path),
                                                      width: 150,
                                                      height: 150,
                                                    ),
                                                  )
                                                : currentImage != null
                                                    ? Image.network(
                                                        currentImage,
                                                        width: 150,
                                                        height: 150,
                                                      )
                                                    : Container(
                                                        width: 100,
                                                        height: 100,
                                                        padding: const EdgeInsets.all(10),
                                                        decoration: BoxDecoration(
                                                          color: primaryColor,
                                                          borderRadius: BorderRadius.circular(8),
                                                        ),
                                                        child:
                                                            Image.asset(ImageProviders.engineering),
                                                      ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
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
                                                },
                                                //onCameraMove: _onCameraMove,
                                              ),
                                        const SizedBox(height: 10),
                                        _buildDescriptionWidget(state),
                                        const SizedBox(height: 10),
                                        _buildDropDownUserWidget(context, users, state),
                                        const SizedBox(height: 30),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width / 1.5,
                                          child: CupertinoButton(
                                            color: primaryColorGreen,
                                            onPressed: widget.isEdit
                                                ? () async {
                                                    if (_formKey.currentState!.validate() &&
                                                        state.selectedMachineType != null &&
                                                        state.selectedMember != null) {
                                                      EasyLoading.show(status: 'กำลังโหลด');
                                                      try {
                                                        final groupName =
                                                            state.borrowGroupNameController.text;
                                                        final description = state
                                                            .borrowGroupDescriptionController.text;
                                                        var image;

                                                        if (state.borrowGroupImageFile != null) {
                                                          image = state.borrowGroupImageFile!.path;
                                                        } else {
                                                          image =
                                                              state.headGroupImagePath.toString();
                                                        }

                                                        final member = state.selectedMember;
                                                        final machineType =
                                                            state.selectedMachineType;

                                                        final response =
                                                            await _agriculturalRepository
                                                                .updateMachine(
                                                          machineId: state.currentEditId.toString(),
                                                          machineName: groupName,
                                                          machineDescription: description,
                                                          machineImage: image ?? '',
                                                          userId: member?.userId.toString() ?? '',
                                                          machineTypeId:
                                                              machineType?.typeId.toString() ?? '',
                                                          lat: initialCameraPosition!.latitude,
                                                          lng: initialCameraPosition!.longitude,
                                                        );
                                                        if (response['result']) {
                                                          state.groupMachineHeadModel = [];
                                                          final gh = await _agriculturalRepository
                                                              .getHeadMachineryList();
                                                          state.groupMachineHeadModel
                                                              .addAll(gh.data!.machines);
                                                          EasyLoading.dismiss();
                                                          // emit(state.copyWith(groupMachineHeadModel: state.groupMachineHeadModel));
                                                          CustomDialog.showCustomDialog(
                                                            context: context,
                                                            title: '',
                                                            description: response['message'],
                                                            icon:
                                                                Image.asset(ImageProviders.success),
                                                            onPressed: () {
                                                              Get.back();
                                                              Get.back();
                                                            },
                                                          );
                                                        } else {}
                                                      } catch (e, t) {
                                                        print(e);
                                                        print(t);
                                                      }
                                                    } else {
                                                      CustomDialog.showCustomDialog(
                                                        context: context,
                                                        title: '',
                                                        description: 'กรุณากรอกข้อมูลให้ครบถ้วน',
                                                        icon: const SizedBox(),
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                      );
                                                    }
                                                  }
                                                : () async {
                                                    if (_formKey.currentState!.validate() &&
                                                        state.borrowGroupImageFile != null &&
                                                        state.selectedMachineType != null &&
                                                        state.selectedMember != null) {
                                                      /*context
                                                      .read<AgriculturalInformationBloc>()
                                                      .add(BorrowSubmitEvent(context: context));*/
                                                      try {
                                                        final groupName =
                                                            state.borrowGroupNameController.text;
                                                        final description = state
                                                            .borrowGroupDescriptionController.text;
                                                        final image = state.borrowGroupImageFile;
                                                        final member = state.selectedMember;
                                                        final machineType =
                                                            state.selectedMachineType;

                                                        EasyLoading.show(status: 'กำลังโหลด');

                                                        final response =
                                                            await _agriculturalRepository
                                                                .addMachine(
                                                          machineName: groupName,
                                                          machineDescription: description,
                                                          machineImage: image?.path ?? '',
                                                          userId: member?.userId.toString() ?? '',
                                                          machineTypeId:
                                                              machineType?.typeId.toString() ?? '',
                                                          lat: initialCameraPosition!.latitude
                                                              .toString(),
                                                          lng: initialCameraPosition!.longitude
                                                              .toString(),
                                                        );
                                                        if (response['result']) {
                                                          state.groupMachineHeadModel = [];
                                                          final gh = await _agriculturalRepository
                                                              .getHeadMachineryList();
                                                          state.groupMachineHeadModel
                                                              .addAll(gh.data!.machines);
                                                          EasyLoading.dismiss();
                                                          // emit(state.copyWith(groupMachineHeadModel: state.groupMachineHeadModel));
                                                          CustomDialog.showCustomDialog(
                                                            context: context,
                                                            title: '',
                                                            description: response['message'],
                                                            icon:
                                                                Image.asset(ImageProviders.success),
                                                            onPressed: () {
                                                              Navigator.of(context, rootNavigator: true)
                                                                  .pop();
                                                              Navigator.of(context, rootNavigator: true)
                                                                  .pop();
                                                            },
                                                          );
                                                        } else {}
                                                      } catch (e, t) {
                                                        print(e);
                                                        print(t);
                                                      }
                                                    } else {
                                                      CustomDialog.showCustomDialog(
                                                        context: context,
                                                        title: '',
                                                        description: 'กรุณากรอกข้อมูลให้ครบถ้วน',
                                                        icon: const SizedBox(),
                                                        onPressed: () {
                                                          Navigator.of(context, rootNavigator: true)
                                                              .pop();
                                                        },
                                                      );
                                                    }
                                                  },
                                            child: CustomText(
                                              text: widget.isEdit
                                                  ? 'แก้ไขเครื่องจักร'
                                                  : 'เพิ่มเครื่องจักร',
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          );
                  } else {
                    return const SizedBox();
                  }
                },
              )),
    );
  }

  Container _buildDropDownUserWidget(BuildContext context, List<GroupMemberModelDataMember> users,
      AgriculturalInformationLoaded state) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: ThemeConfig.primary, width: 2),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<GroupMemberModelDataMember>(
          isExpanded: true,
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.white,
            ),
            scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(40),
              thickness: MaterialStateProperty.all(6),
              thumbVisibility: MaterialStateProperty.all(true),
            ),
            offset: const Offset(0, -10),
          ),
          hint: Text(
            'ผู้ครอบครองเครื่องจักร',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          items: users
              .map(
                  (GroupMemberModelDataMember item) => DropdownMenuItem<GroupMemberModelDataMember>(
                        value: item,
                        child: CustomText(
                          text: "${item.firstname} ${item.lastname}",
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ))
              .toList(),
          value: state.selectedMember,
          onChanged: (GroupMemberModelDataMember? value) {
            context
                .read<AgriculturalInformationBloc>()
                .add(BorrowAgriculturalSelectedMemberEvent(member: value!));
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            width: 140,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
        ),
      ),
    );
  }

  Container _buildDescriptionWidget(AgriculturalInformationLoaded state) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(4),
      ),
      child: CustomTextFieldWidget(
        controller: state.borrowGroupDescriptionController,
        placeHolder: 'รายละเอียดเพิ่มเติม',
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณากรอกรายละเอียดเพิ่มเติม';
          }
          return null;
        },
        maxLine: 5,
      ),
    );
  }

  Container _buildGroupDropDownWidget(
      BuildContext context, List<MachineType> types, AgriculturalInformationLoaded state) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: ThemeConfig.primary, width: 2),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<MachineType>(
          isExpanded: true,
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.white,
            ),
            scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(40),
              thickness: MaterialStateProperty.all(6),
              thumbVisibility: MaterialStateProperty.all(true),
            ),
            offset: const Offset(0, -10),
          ),
          hint: Text(
            'ประเภทเครื่องจักร',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          items: types
              .map((MachineType item) => DropdownMenuItem<MachineType>(
                    value: item,
                    child: CustomText(
                      text: item.typeName ?? '',
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ))
              .toList(),
          value: state.selectedMachineType,
          onChanged: (MachineType? value) {
            context
                .read<AgriculturalInformationBloc>()
                .add(BorrowAgriculturalSelectedMachineEvent(machineType: value!));
            // context.read<RegisterBloc>().add(RegisterGroupSelectedChanged(value!));
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            width: 140,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
        ),
      ),
    );
  }

  Container _buildNameWidget(AgriculturalInformationLoaded state) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(4),
      ),
      child: CustomTextFieldWidget(
        controller: state.borrowGroupNameController,
        placeHolder: 'ชื่อเครื่องจักร',
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณากรอกชื่อเครื่องจักร';
          }
          return null;
        },
      ),
    );
  }
}
