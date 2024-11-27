part of 'agricultural_information_bloc.dart';

@immutable
abstract class AgriculturalInformationEvent {}

class AgriculturalInformationInitialEvent extends AgriculturalInformationEvent {
  final bool isAdmin;
  final bool isHead;
  final String gId;

  AgriculturalInformationInitialEvent({
    required this.isAdmin,
    required this.isHead,
    this.gId = '',
  });
}

class HeadAgriculturalGetAddressEvent extends AgriculturalInformationEvent {}

class HeadChangeImageEvent extends AgriculturalInformationEvent {
  final XFile img;

  HeadChangeImageEvent({
    required this.img,
  });
}

class HeadReSetImageEvent extends AgriculturalInformationEvent {}

class HeadSubmitEvent extends AgriculturalInformationEvent {
final BuildContext context;

  HeadSubmitEvent({
    required this.context,
  });

}


class BorrowAgriculturalSelectedMachineEvent extends AgriculturalInformationEvent {
  final MachineType machineType;

  BorrowAgriculturalSelectedMachineEvent({
    required this.machineType,
  });
}
class BorrowAgriculturalSelectedMemberEvent extends AgriculturalInformationEvent {
  final GroupMemberModelDataMember member;

  BorrowAgriculturalSelectedMemberEvent({
    required this.member,
  });
}
class BorrowAgriculturalChangeImageEvent extends AgriculturalInformationEvent {
  final XFile img;

  BorrowAgriculturalChangeImageEvent({
    required this.img,
  });
}

class BorrowSubmitEvent extends AgriculturalInformationEvent {
  final BuildContext context;

  BorrowSubmitEvent({
    required this.context,
  });
}

class BorrowSubmitEditEvent extends AgriculturalInformationEvent {
  final BuildContext context;

  BorrowSubmitEditEvent({
    required this.context,
  });
}


class BorrowAgriculturalEditEvent extends AgriculturalInformationEvent {
  final String machineId;

  BorrowAgriculturalEditEvent({
    required this.machineId,
  });
}
class BorrowAgriculturalDeleteEvent extends AgriculturalInformationEvent {
  final BuildContext context;
  final String machineId;

  BorrowAgriculturalDeleteEvent({
    required this.machineId,
    required this.context,
  });
}
class BorrowAgriculturalResetEvent extends AgriculturalInformationEvent {}


class HeadInitialLatLngEvent extends AgriculturalInformationEvent {
  final GoogleMapController controller;

  HeadInitialLatLngEvent({
    required this.controller,
  });
}

class HeadChangeLatLngEvent extends AgriculturalInformationEvent {
  final LatLng latLng;

  HeadChangeLatLngEvent({
    required this.latLng,
  });
}

class HeadChangeMarkerEvent extends AgriculturalInformationEvent {
  final CameraPosition position ;

  HeadChangeMarkerEvent({
    required this.position,
  });
}

class HeadOnMapCreatedEvent extends AgriculturalInformationEvent {
  final GoogleMapController controller;
  final bool isEdit;

  HeadOnMapCreatedEvent({
    required this.controller,
    required this.isEdit,
  });
}

class HeadMapIdleEvent extends AgriculturalInformationEvent {}

class HeadSearchAddressEvent extends AgriculturalInformationEvent {
  final String query;

  HeadSearchAddressEvent({
    required this.query,
  });
}

class LoadMachineryTypesEvent extends AgriculturalInformationEvent {}


class LoadDataFromTableEvent extends AgriculturalInformationEvent {
  final int index;

  LoadDataFromTableEvent({
    required this.index,
  });
}