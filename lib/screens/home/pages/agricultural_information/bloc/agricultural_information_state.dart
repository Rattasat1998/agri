part of 'agricultural_information_bloc.dart';

@immutable
abstract class AgriculturalInformationState {}

class AgriculturalInformationLoading extends AgriculturalInformationState {}
class AgriculturalInformationLoaded extends AgriculturalInformationState {

   GroupInformationModel groupInformationModel;
   GroupAddressModel groupAddressModel;
   GroupMemberModel groupMemberModel;
   GroupMachineModel groupMachineModel;

  final GroupMemberModel? groupMemberHeadModel;
   List<GroupMachineModelDataMachine> groupMachineHeadModel;
   GroupHeadAddressModel? groupHeadAddressModel;
  final MachineTypeModel? machineTypeModel;
   MachineDetailModel? machineDetailModel;
   bool isLoading;
   bool isAddressMapLoading;


  // head
  final TextEditingController headGroupNameController;
  final TextEditingController headGroupAddressController;
  final TextEditingController headGroupDescriptionController;
   XFile? headGroupImageFile;
   var currentEditId;


   //borrow
   TextEditingController borrowGroupNameController;
   TextEditingController borrowGroupDescriptionController;
   XFile? borrowGroupImageFile;
   MachineType? selectedMachineType;
   var headGroupImagePath;
   GroupMemberModelDataMember? selectedMember;
  bool isEditing;

  GoogleMapController? mapController;
   LatLng initialCameraPosition;
   Set<Marker> markers = {};
   String? currentAddress;
   List<String> addressList = [];




  AgriculturalInformationLoaded({
    required this.groupInformationModel,
    required this.groupAddressModel,
    required this.groupMemberModel,
    required this.groupMachineModel,
     this.groupHeadAddressModel,
    required this.headGroupNameController,
    required this.headGroupAddressController,
    required this.headGroupDescriptionController,
    this.headGroupImageFile,
    this.groupMemberHeadModel,
    this.groupMachineHeadModel = const [],
    this.machineTypeModel,
    required this.borrowGroupNameController,
    required this.borrowGroupDescriptionController,
    this.borrowGroupImageFile,
    this.selectedMachineType,
    this.selectedMember,
    this.isEditing = false,
    this.headGroupImagePath,
    this.machineDetailModel,
    this.currentEditId,
    this.isLoading = false,
    this.mapController,
    required this.initialCameraPosition,
    this.markers = const {},
    this.currentAddress,
    this.isAddressMapLoading = false,
    this.addressList = const [],
  });

  AgriculturalInformationLoaded copyWith({
    GroupInformationModel? groupInformationModel,
    GroupAddressModel? groupAddressModel,
    GroupMemberModel? groupMemberModel,
    GroupMachineModel? groupMachineModel,
    GroupHeadAddressModel? groupHeadAddressModel,
    TextEditingController? headGroupNameController,
    TextEditingController? headGroupAddressController,
    TextEditingController? headGroupDescriptionController,
    XFile? headGroupImageFile,
    GroupMemberModel? groupMemberHeadModel,
    List<GroupMachineModelDataMachine>? groupMachineHeadModel,
    MachineTypeModel? machineTypeModel,
    TextEditingController? borrowGroupNameController,
    TextEditingController? borrowGroupDescriptionController,
    XFile? borrowGroupImageFile,
    MachineType? selectedMachineType,
    GroupMemberModelDataMember? selectedMember,
    var headGroupImagePath,
    bool? isEditing,
    MachineDetailModel? machineDetailModel,
    var currentEditId,
    bool? isLoading,
    GoogleMapController? mapController,
    LatLng? initialCameraPosition,
    Set<Marker>? markers,
    String? currentAddress,
    bool? isAddressMapLoading,
    List<String>? addressList,
  }) {
    return AgriculturalInformationLoaded(
      groupInformationModel: groupInformationModel ?? this.groupInformationModel,
      groupAddressModel: groupAddressModel ?? this.groupAddressModel,
      groupMemberModel: groupMemberModel ?? this.groupMemberModel,
      groupMachineModel: groupMachineModel ?? this.groupMachineModel,
      groupHeadAddressModel: groupHeadAddressModel ?? this.groupHeadAddressModel,
      headGroupNameController: headGroupNameController ?? this.headGroupNameController,
      headGroupAddressController: headGroupAddressController ?? this.headGroupAddressController,
      headGroupDescriptionController: headGroupDescriptionController ?? this.headGroupDescriptionController,
      headGroupImageFile: headGroupImageFile ?? this.headGroupImageFile,
      groupMemberHeadModel: groupMemberHeadModel ?? this.groupMemberHeadModel,
      groupMachineHeadModel: groupMachineHeadModel ?? this.groupMachineHeadModel,
      machineTypeModel: machineTypeModel ?? this.machineTypeModel,
      borrowGroupNameController: borrowGroupNameController ?? this.borrowGroupNameController,
      borrowGroupDescriptionController: borrowGroupDescriptionController ?? this.borrowGroupDescriptionController,
      borrowGroupImageFile: borrowGroupImageFile ?? this.borrowGroupImageFile,
      selectedMachineType: selectedMachineType ?? this.selectedMachineType,
      selectedMember: selectedMember ?? this.selectedMember,
      isEditing: isEditing ?? this.isEditing,
      headGroupImagePath: headGroupImagePath ?? this.headGroupImagePath,
      machineDetailModel: machineDetailModel ?? this.machineDetailModel,
      currentEditId: currentEditId ?? this.currentEditId,
      isLoading: isLoading ?? this.isLoading,
      mapController: mapController ?? this.mapController,
      initialCameraPosition: initialCameraPosition ?? this.initialCameraPosition,
      markers: markers ?? this.markers,
      currentAddress: currentAddress ?? this.currentAddress,
      isAddressMapLoading: isAddressMapLoading ?? this.isAddressMapLoading,
      addressList: addressList ?? this.addressList,
    );
  }



}
