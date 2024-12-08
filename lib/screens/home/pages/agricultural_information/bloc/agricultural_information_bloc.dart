import 'dart:async';

import 'package:agri/screens/home/pages/agricultural_information/head/models/group_head_address_model.dart';
import 'package:agri/screens/home/pages/agricultural_information/models/group_address_model.dart';
import 'package:agri/screens/home/pages/agricultural_information/models/group_information_model.dart';
import 'package:agri/screens/home/pages/agricultural_information/models/group_machine_detail_model.dart';
import 'package:agri/screens/home/pages/agricultural_information/models/group_machine_model.dart';
import 'package:agri/screens/home/pages/agricultural_information/models/group_machine_type_model.dart';
import 'package:agri/screens/home/pages/agricultural_information/models/group_member_model.dart';
import 'package:agri/screens/home/pages/agricultural_information/repository/agricultural_repository.dart';
import 'package:agri/utils/image_provider.dart';
import 'package:agri/widgets/custom_dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../services/permission_service.dart';

part 'agricultural_information_event.dart';

part 'agricultural_information_state.dart';

class AgriculturalInformationBloc
    extends Bloc<AgriculturalInformationEvent, AgriculturalInformationState> {
  final AgriculturalRepository _agriculturalRepository = AgriculturalRepository();

  AgriculturalInformationBloc() : super(AgriculturalInformationLoading()) {
    on<AgriculturalInformationInitialEvent>(_onAgriculturalInformationInitialEvent);
    on<LoadMachineryTypesEvent>(_onLoadMachineryTypesEvent);
    on<HeadAgriculturalGetAddressEvent>(_onHeadAgriculturalGetAddressEvent);
    on<HeadChangeImageEvent>(_onHeadChangeImageEvent);
    on<HeadReSetImageEvent>(_onHeadReSetImageEvent);
    on<HeadSubmitEvent>(_onHeadSubmitEvent);
    on<BorrowAgriculturalSelectedMachineEvent>(_onBorrowAgriculturalSelectedMachineEvent);
    on<BorrowAgriculturalSelectedMemberEvent>(_onBorrowAgriculturalSelectedMemberEvent);
    on<BorrowAgriculturalChangeImageEvent>(_onBorrowAgriculturalChangeImageEvent);
    on<BorrowSubmitEvent>(_onBorrowSubmitEvent);
    on<BorrowSubmitEditEvent>(_onBorrowSubmitEditEvent);
    on<BorrowAgriculturalEditEvent>(_onBorrowAgriculturalEditEvent);
    on<BorrowAgriculturalResetEvent>(_onBorrowAgriculturalResetEvent);
    on<BorrowAgriculturalDeleteEvent>(_onBorrowAgriculturalDeleteEvent);
    // map
    on<HeadInitialLatLngEvent>(_onHeadInitialLatLngEvent);
    on<HeadChangeLatLngEvent>(_onHeadChangeLatLngEvent);
    on<HeadOnMapCreatedEvent>(_onHeadOnMapCreatedEvent);
    on<HeadChangeMarkerEvent>(_onHeadChangeMarkerEvent);
    on<HeadMapIdleEvent>(_onHeadMapIdleEvent);
    on<HeadSearchAddressEvent>(_onHeadSearchAddressEvent);
  }

  void _onLoadMachineryTypesEvent(
      LoadMachineryTypesEvent event, Emitter<AgriculturalInformationState> emit) async {
    final state = this.state;
    if (state is AgriculturalInformationLoaded) {
      final machineTypeModel = await _agriculturalRepository.getMachineTypeList();
      emit(state.copyWith(machineTypeModel: machineTypeModel));
    }
  }

  void _onHeadSearchAddressEvent(
      HeadSearchAddressEvent event, Emitter<AgriculturalInformationState> emit) async {
    final state = this.state;
    if (state is AgriculturalInformationLoaded) {
      try {
        //  state.addressList = [];
        emit(state.copyWith(isAddressMapLoading: true, addressList: state.addressList));
        final List<String> current = await getAddressFromQuery(event.query);
        print('current = $current');
        emit(state.copyWith(
            addressList: current, isAddressMapLoading: false, markers: state.markers));
      } catch (e) {
        print(e);
      }
    }
  }

  void _onHeadMapIdleEvent(
      HeadMapIdleEvent event, Emitter<AgriculturalInformationState> emit) async {
    final state = this.state;
    if (state is AgriculturalInformationLoaded) {
      try {
        final String? current = await getAddressFromLocation(state.initialCameraPosition);
        print(current);
        emit(state.copyWith(currentAddress: current));
      } catch (e) {
        print(e);
      }
    }
  }

  Future<List<String>> getAddressFromQuery(String latLng) async {
    // From coordinates
    List<String> address = [];
    List<Location> locations = await locationFromAddress(latLng);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(locations[0].latitude, locations[0].longitude);
    placemarks.forEach((element) {
      address.add(
          '${element.name}, ${element.subLocality}, ${element.locality}, ${element.administrativeArea}, ${element.country}');
    });
    return address;
  }

  Future<String?> getAddressFromLocation(LatLng latLng) async {
    // From coordinates
    List<Placemark> placemarks = await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    Placemark place = placemarks[0];
    return place.name;
  }

  void _onHeadChangeMarkerEvent(
      HeadChangeMarkerEvent event, Emitter<AgriculturalInformationState> emit) async {
    final state = this.state;
    if (state is AgriculturalInformationLoaded) {
      final position = event.position.target;
      emit(state.copyWith(
        initialCameraPosition: position,
        mapController: state.mapController,
        markers: {
          Marker(
            markerId: const MarkerId('1'),
            position: LatLng(position.latitude, position.longitude),
          ),
        },
        isAddressMapLoading: true,
      ));
      state.mapController?.animateCamera(
        CameraUpdate.newLatLng(LatLng(position.latitude, position.longitude)),
      );
    }
  }

  void _onHeadOnMapCreatedEvent(
      HeadOnMapCreatedEvent event, Emitter<AgriculturalInformationState> emit) async {
    final state = this.state;
    if (state is AgriculturalInformationLoaded) {
      print(state.initialCameraPosition);
      if (state.initialCameraPosition == null) {
        add(HeadInitialLatLngEvent(controller: event.controller));
        return;
      } else {
        emit(
          state.copyWith(
            mapController: event.controller,
            markers: {
              Marker(
                markerId: const MarkerId('1'),
                position: LatLng(
                    state.initialCameraPosition!.latitude, state.initialCameraPosition!.longitude),
              ),
            },
          ),
        );
        state.mapController?.animateCamera(
          CameraUpdate.newLatLng(LatLng(
              state.initialCameraPosition!.latitude, state.initialCameraPosition!.longitude)),
        );
      }
    }
  }

  void _onHeadChangeLatLngEvent(
      HeadChangeLatLngEvent event, Emitter<AgriculturalInformationState> emit) async {
    final state = this.state;
    if (state is AgriculturalInformationLoaded) {
      emit(state.copyWith(
        initialCameraPosition: event.latLng,
        markers: {
          Marker(
            markerId: const MarkerId('1'),
            position: LatLng(event.latLng.latitude, event.latLng.longitude),
          ),
        },
      ));
    }
  }

  void _onHeadInitialLatLngEvent(
      HeadInitialLatLngEvent event, Emitter<AgriculturalInformationState> emit) async {
    final state = this.state;
    if (state is AgriculturalInformationLoaded) {
      Position position = await locationPermissionStatus();

      emit(state.copyWith(
        mapController: event.controller,
        initialCameraPosition: LatLng(position.latitude, position.longitude),
        markers: {
          Marker(
            markerId: const MarkerId('1'),
            position: LatLng(position.latitude, position.longitude),
          ),
        },
      ));
      // await Future.delayed(const Duration(seconds: 2));
      state.mapController?.animateCamera(
        CameraUpdate.newLatLng(
            LatLng(state.initialCameraPosition.latitude, state.initialCameraPosition.longitude)),
      );
      //add(HeadChangeLatLngEvent(latLng: LatLng(position.latitude, position.longitude)));
      //await Future.delayed(const Duration(seconds: 1));
      /* state.mapController?.animateCamera(
        CameraUpdate.newLatLng(LatLng(position.latitude, position.longitude)),
      );*/
    }
  }

  final permissionLocation = Permission.location;

  Future<Position> locationPermissionStatus() async {
    // Request location permission
    final status = await permissionLocation.request();
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

  void _onBorrowAgriculturalDeleteEvent(
      BorrowAgriculturalDeleteEvent event, Emitter<AgriculturalInformationState> emit) async {
    final state = this.state;
    final context = event.context;
    if (state is AgriculturalInformationLoaded) {
      EasyLoading.show(status: 'กำลังโหลด');
      final response = await _agriculturalRepository.deleteMachineById(id: event.machineId);
      if (response['result']) {
        state.groupMachineHeadModel = [];
        final gh = await _agriculturalRepository.getHeadMachineryList();
        state.groupMachineHeadModel.addAll(gh.data!.machines);
        emit(state.copyWith(groupMachineHeadModel: state.groupMachineHeadModel));
        EasyLoading.dismiss();
        CustomDialog.showCustomDialog(
          context: context,
          title: '',
          description: response['message'],
          icon: Image.asset(ImageProviders.success),
          onPressed: () {
            // Get.back();
            Get.back();
            Get.back();
          },
        );
      } else {}
    }
  }

  void _onBorrowAgriculturalResetEvent(
      BorrowAgriculturalResetEvent event, Emitter<AgriculturalInformationState> emit) async {
    final state = this.state;
    if (state is AgriculturalInformationLoaded) {
      state.machineDetailModel = null;
      state.selectedMachineType = null;
      state.selectedMember = null;
      state.headGroupImagePath = null;
      state.borrowGroupImageFile = null;
      state.currentEditId = null;
      Position position = await locationPermissionStatus();
      state.markers = {};

      emit(state.copyWith(
        borrowGroupNameController: TextEditingController(text: ''),
        borrowGroupDescriptionController: TextEditingController(text: ''),
        borrowGroupImageFile: null,
        machineDetailModel: null,
        selectedMachineType: null,
        selectedMember: null,
        headGroupImagePath: null,
        currentEditId: null,
        initialCameraPosition: LatLng(position.latitude, position.longitude),
        markers: {},
      ));
    }
  }

  void _onBorrowAgriculturalEditEvent(
      BorrowAgriculturalEditEvent event, Emitter<AgriculturalInformationState> emit) async {
    final state = this.state;
    if (state is AgriculturalInformationLoaded) {
      emit(state.copyWith(isEditing: true));
      final machine = await _agriculturalRepository.getMachineById(id: event.machineId);
      final currentType = state.machineTypeModel!.data!.machineType
          .firstWhere((element) => element.typeId == machine.data!.machine!.typeId);
      final currentMember = state.groupMemberHeadModel!.data!.members
          .firstWhere((element) => element.userId == machine.data!.machine!.userId);
      emit(state.copyWith(
        machineDetailModel: machine,
        initialCameraPosition: LatLng(
            double.parse(machine.data!.machine!.lat), double.parse(machine.data!.machine!.lng)),
        borrowGroupNameController: TextEditingController(text: machine.data!.machine!.machineName),
        borrowGroupDescriptionController:
            TextEditingController(text: machine.data!.machine!.description),
        headGroupImagePath: machine.data!.machine!.machineImg,
        isEditing: false,
        selectedMachineType: currentType,
        selectedMember: currentMember,
        currentEditId: event.machineId,
      ));
    }
  }

  void _onBorrowSubmitEditEvent(
      BorrowSubmitEditEvent event, Emitter<AgriculturalInformationState> emit) async {
    final state = this.state;
    final context = event.context;
    if (state is AgriculturalInformationLoaded) {
      try {
        final groupName = state.borrowGroupNameController.text;
        final description = state.borrowGroupDescriptionController.text;
        var image;

        if (state.borrowGroupImageFile != null) {
          image = state.borrowGroupImageFile!.path;
        } else {
          image = state.headGroupImagePath.toString();
        }

        final member = state.selectedMember;
        final machineType = state.selectedMachineType;

        final response = await _agriculturalRepository.updateMachine(
          machineId: state.currentEditId.toString(),
          machineName: groupName,
          machineDescription: description,
          machineImage: image ?? '',
          userId: member?.userId.toString() ?? '',
          machineTypeId: machineType?.typeId.toString() ?? '',
          lat: state.initialCameraPosition.latitude,
          lng: state.initialCameraPosition.longitude,
        );
        if (response['result']) {
          Get.back();
          state.groupMachineHeadModel = [];
          final gh = await _agriculturalRepository.getHeadMachineryList();
          state.groupMachineHeadModel.addAll(gh.data!.machines);
          emit(state.copyWith(groupMachineHeadModel: state.groupMachineHeadModel));
          CustomDialog.showCustomDialog(
            context: context,
            title: '',
            description: response['message'],
            icon: Image.asset(ImageProviders.success),
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
    }
  }

  void _onBorrowSubmitEvent(
      BorrowSubmitEvent event, Emitter<AgriculturalInformationState> emit) async {
    final state = this.state;
    final context = event.context;
    if (state is AgriculturalInformationLoaded) {
      try {
        final groupName = state.borrowGroupNameController.text;
        final description = state.borrowGroupDescriptionController.text;
        final image = state.borrowGroupImageFile;
        final member = state.selectedMember;
        final machineType = state.selectedMachineType;

        /*CustomDialog.showLoadingDialog(
            context: context,
            description: 'กำลังโหลด',
            icon: const Center(child: CircularProgressIndicator.adaptive()));*/
        EasyLoading.show(status: 'กำลังโหลด');
        final response = await _agriculturalRepository.addMachine(
          machineName: groupName,
          machineDescription: description,
          machineImage: image?.path ?? '',
          userId: member?.userId.toString() ?? '',
          machineTypeId: machineType?.typeId.toString() ?? '',
          lat: state.initialCameraPosition.latitude.toString(),
          lng: state.initialCameraPosition.longitude.toString(),
        );
        if (response['result']) {

          state.groupMachineHeadModel = [];
          final gh = await _agriculturalRepository.getHeadMachineryList();
          state.groupMachineHeadModel.addAll(gh.data!.machines);
          emit(state.copyWith(groupMachineHeadModel: state.groupMachineHeadModel));
          EasyLoading.dismiss();
          CustomDialog.showCustomDialog(
            context: context,
            title: '',
            description: response['message'],
            icon: Image.asset(ImageProviders.success),
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
    }
  }

  void _onBorrowAgriculturalChangeImageEvent(
      BorrowAgriculturalChangeImageEvent event, Emitter<AgriculturalInformationState> emit) async {
    final state = this.state;
    if (state is AgriculturalInformationLoaded) {
      emit(state.copyWith(borrowGroupImageFile: event.img));
    }
  }

  void _onBorrowAgriculturalSelectedMemberEvent(BorrowAgriculturalSelectedMemberEvent event,
      Emitter<AgriculturalInformationState> emit) async {
    final state = this.state;
    if (state is AgriculturalInformationLoaded) {
      emit(state.copyWith(selectedMember: event.member));
    }
  }

  void _onBorrowAgriculturalSelectedMachineEvent(BorrowAgriculturalSelectedMachineEvent event,
      Emitter<AgriculturalInformationState> emit) async {
    final state = this.state;
    if (state is AgriculturalInformationLoaded) {
      emit(state.copyWith(selectedMachineType: event.machineType));
    }
  }

  void _onHeadSubmitEvent(HeadSubmitEvent event, Emitter<AgriculturalInformationState> emit) async {
    final state = this.state;
    final context = event.context;
    if (state is AgriculturalInformationLoaded) {

    }
  }

  void _onHeadReSetImageEvent(
      HeadReSetImageEvent event, Emitter<AgriculturalInformationState> emit) async {
    final state = this.state;
    if (state is AgriculturalInformationLoaded) {
      state.headGroupImageFile = null;
      state.borrowGroupImageFile = null;
      state.borrowGroupNameController = TextEditingController(text: '');
      state.borrowGroupDescriptionController = TextEditingController(text: '');
      state.borrowGroupImageFile = null;
      state.selectedMachineType = null;
      state.selectedMember = null;
      state.headGroupImagePath = null;

      emit(state.copyWith(
        headGroupImageFile: state.headGroupImageFile,
        borrowGroupNameController: state.borrowGroupNameController,
        borrowGroupDescriptionController: state.borrowGroupDescriptionController,
        borrowGroupImageFile: state.borrowGroupImageFile,
        selectedMachineType: state.selectedMachineType,
        selectedMember: state.selectedMember,
        headGroupImagePath: state.headGroupImagePath,
      ));
    }
  }

  void _onHeadChangeImageEvent(
      HeadChangeImageEvent event, Emitter<AgriculturalInformationState> emit) async {
    final state = this.state;
    if (state is AgriculturalInformationLoaded) {
      emit(state.copyWith(headGroupImageFile: event.img));
    }
  }

  void _onHeadAgriculturalGetAddressEvent(
      HeadAgriculturalGetAddressEvent event, Emitter<AgriculturalInformationState> emit) async {
    final state = this.state;
    if (state is AgriculturalInformationLoaded) {
      final gh = await _agriculturalRepository.getHeadAgriculturalAddress();
      emit(state.copyWith(groupHeadAddressModel: gh));
    }
  }

  void _onAgriculturalInformationInitialEvent(
      AgriculturalInformationInitialEvent event, Emitter<AgriculturalInformationState> emit) async {
    final isAdmin = event.isAdmin;
    final id = event.gId;
    final GroupInformationModel agriculturalInformation;
    final GroupAddressModel agriculturalAddress;
    final GroupMemberModel agriculturalMember;
    final GroupMachineModel agriculturalMachine;

    // head
    final GroupMemberModel agriculturalHeadMember;
    final GroupMachineModel agriculturalHeadMachine;
    final List<GroupMachineModelDataMachine> groupMachineHeadModel = [];
    final MachineTypeModel machineTypeModel;
    try {
      emit(AgriculturalInformationLoading());

      final gh = await _agriculturalRepository.getHeadAgriculturalAddress();
      agriculturalHeadMember = await _agriculturalRepository.getHeadMember();
      agriculturalHeadMachine = await _agriculturalRepository.getHeadMachineryList();
      machineTypeModel = await _agriculturalRepository.getMachineTypeList();

      groupMachineHeadModel.addAll(agriculturalHeadMachine.data?.machines ?? []);

      if (isAdmin) {
        print('admin');
        agriculturalInformation =
            await _agriculturalRepository.getAgriculturalInformationByGroupId(id: id);
        agriculturalAddress = await _agriculturalRepository.getAgriculturalAddressByGroupId(id: id);
        agriculturalMember = await _agriculturalRepository.getAgriculturalMemberByGroupId(id: id);
        agriculturalMachine = await _agriculturalRepository.getAgriculturalMachineByGroupId(id: id);
        groupMachineHeadModel.addAll(agriculturalMachine.data?.machines ?? []);
      } else {
        print('fetch start');
        agriculturalInformation = await _agriculturalRepository.getAgriculturalInformation();
        print('agriculturalInformation = ${agriculturalInformation.data!.information!.toJson()}');
        agriculturalAddress = await _agriculturalRepository.getAgriculturalAddress();
        print('agriculturalAddress = ${agriculturalAddress.data!.groupData!.toJson()}');
        agriculturalMember = await _agriculturalRepository.getAgriculturalMember();
        print('agriculturalMember = ${agriculturalMember.data!.members}');
        agriculturalMachine = await _agriculturalRepository.getAgriculturalMachine();
        print('agriculturalMachine = ${agriculturalMachine.data!.machines.length}');
        print('fetch success');

      }

      Position position = await locationPermissionStatus();

      print('Here ios There');
      emit(AgriculturalInformationLoaded(
        groupInformationModel: agriculturalInformation,
        groupAddressModel: agriculturalAddress,
        groupMemberModel: agriculturalMember,
        groupMachineModel: agriculturalMachine,
        groupMemberHeadModel: agriculturalHeadMember,
        groupMachineHeadModel: groupMachineHeadModel,
        groupHeadAddressModel: gh,
        machineTypeModel: machineTypeModel,
        headGroupNameController: TextEditingController(text: gh.data?.group?.groupName ?? ''),
        headGroupAddressController: TextEditingController(text: gh.data?.group?.groupAddress ?? ''),
        headGroupDescriptionController:
            TextEditingController(text: gh.data?.group?.description ?? ''),
        headGroupImageFile: null,
        borrowGroupNameController: TextEditingController(text: ''),
        borrowGroupDescriptionController: TextEditingController(text: ''),
        initialCameraPosition: LatLng(position.latitude, position.longitude),
      ));
    } catch (e,t) {
      print('agricultural_information_bloc.dart');
      print(e);
      print(t);
    }
  }
}
