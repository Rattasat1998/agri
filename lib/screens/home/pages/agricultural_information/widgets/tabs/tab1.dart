import 'package:agri/screens/home/pages/agricultural_information/bloc/agricultural_information_bloc.dart';
import 'package:agri/screens/home/pages/agricultural_information/head/models/group_head_address_model.dart';
import 'package:agri/screens/home/pages/agricultural_information/models/group_address_model.dart';
import 'package:agri/screens/home/pages/agricultural_information/models/place_group_model.dart';
import 'package:agri/utils/app_routers.dart';
import 'package:agri/utils/custom_google_map_widget.dart';
import 'package:agri/utils/role_status.dart';
import 'package:agri/utils/themes.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Tab1 extends StatefulWidget {
  final GroupAddressModelGroupData address;
  final GroupHeadAddressModelData? headAddress;

  const Tab1({
    Key? key,
    required this.address,
    this.headAddress,
  }) : super(key: key);

  @override
  State<Tab1> createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  late GoogleMapController _controller;

  Set<Marker> markers = const {};

  @override
  Widget build(BuildContext context) {
    final isHead = RoleStatus().getRoleHead(context);

    return BlocBuilder<AgriculturalInformationBloc, AgriculturalInformationState>(
      builder: (context, state) {
        if (state is AgriculturalInformationLoading) {
          return const Scaffold(
            backgroundColor: Colors.white,
            body: Center(child: CircularProgressIndicator.adaptive()),
          );
        }
        if (state is AgriculturalInformationLoaded) {
          final address = state.groupAddressModel.data!.groupData!;
          return Container(
            color: Colors.white,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  Visibility(
                    visible: isHead,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomText(
                            text: 'สำหรับหัวหน้ากลุ่มเกษตรกร',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          CupertinoButton(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            color: ThemeConfig.headButtonColor,
                            child: const CustomText(
                              text: 'แก้ไขข้อมูลกลุ่ม',
                              fontSize: 16,
                              color: Colors.white,
                            ),
                            onPressed: () async {
                               await Navigator.pushNamed(
                                context,
                                AppRoutes.headEditAddressPage,
                                arguments: widget.headAddress,
                              );

                                setState(() {
                                  markers = {};
                                  _controller.animateCamera(
                                    CameraUpdate.newCameraPosition(
                                      CameraPosition(
                                        target: LatLng(
                                          double.parse(address.latitude!.toString()),
                                          double.parse(address.longitude!.toString()),
                                        ),
                                        zoom: 15,
                                      ),
                                    ),
                                  );
                                  markers = {
                                    Marker(
                                      markerId: const MarkerId('1'),
                                      position: LatLng(
                                        double.parse(address.latitude!.toString()),
                                        double.parse(address.longitude!.toString()),
                                      ),
                                      infoWindow: InfoWindow(
                                        title: address.groupName!,
                                        snippet: address.groupAddress!,
                                      ),
                                    ),
                                  };
                                });
                                context
                                    .read<AgriculturalInformationBloc>()
                                    .add(HeadReSetImageEvent());

                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Divider(
                          color: Colors.green.shade100,
                          thickness: 2,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.green.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const CustomText(text: 'ที่ตั้งทั้งหมด'),
                        ),
                      ],
                    ),
                  ),
                  MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: Column(
                      children: [
                        isHead
                            ? Container(
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    //color: const Color(0xff303030),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(color: Colors.grey.shade100),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                      )
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: CustomText(
                                        text: address.groupName!,
                                        color: const Color(0xff194902),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    /*_buildRowData(
                          context: context,
                          title: 'ประธานกลุ่ม :  ',
                          subtitle: address.,
                        ),*/
                                    _buildRowData(
                                      context: context,
                                      title: 'ที่ตั้ง :  ',
                                      subtitle: address.groupAddress!,
                                    ),
                                    _buildRowData(
                                      context: context,
                                      title: 'เบอร์โทร :  ',
                                      subtitle: address.groupTel!,
                                    ),
                                    _buildRowData(
                                      context: context,
                                      title: 'รายละเอียด :  ',
                                      subtitle: address.description!,
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    //color: const Color(0xff303030),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(color: Colors.grey.shade100),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                      )
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: CustomText(
                                        text: address.groupName!,
                                        color: const Color(0xff194902),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    /*_buildRowData(
                          context: context,
                          title: 'ประธานกลุ่ม :  ',
                          subtitle: address.,
                        ),*/
                                    _buildRowData(
                                      context: context,
                                      title: 'ที่ตั้ง :  ',
                                      subtitle: address.groupAddress!,
                                    ),
                                    _buildRowData(
                                      context: context,
                                      title: 'เบอร์โทร :  ',
                                      subtitle: address.groupTel!,
                                    ),
                                    _buildRowData(
                                      context: context,
                                      title: 'รายละเอียด :  ',
                                      subtitle: address.description!,
                                    ),
                                  ],
                                ),
                              ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: CustomGoogleMapWidget(
                            height: 180,
                            onMapCreated: (controller) {
                              _controller = controller;
                              _controller.animateCamera(
                                CameraUpdate.newCameraPosition(
                                  CameraPosition(
                                    target: LatLng(
                                      double.parse(address.latitude!.toString()),
                                      double.parse(address.longitude!.toString()),
                                    ),
                                    zoom: 15,
                                  ),
                                ),
                              );
                              markers = {
                                Marker(
                                  markerId: const MarkerId('1'),
                                  position: LatLng(
                                    double.parse(address.latitude!.toString()),
                                    double.parse(address.longitude!.toString()),
                                  ),
                                  infoWindow: InfoWindow(
                                    title: address.groupName!,
                                    snippet: address.groupAddress!,
                                  ),
                                ),
                              };
                              setState(() {});
                            },
                            initialCameraPosition: CameraPosition(
                              target: LatLng(
                                double.parse(address.latitude!.toString()),
                                double.parse(address.longitude!.toString()),
                              ),
                              zoom: 15,
                            ),
                            markers: markers,
                            //onCameraMove: _onCameraMove,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Scaffold(
            backgroundColor: Colors.white,
            body: Center(child: Text('')),
          );
        }
      },
    );
  }

  Widget _buildRowData({
    required BuildContext context,
    required String title,
    required String subtitle,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 2,
            child: CustomText(
              text: title,
              textAlign: TextAlign.right,
            )),
        const SizedBox(
          width: 5,
        ),
        Expanded(
            flex: 4,
            child: CustomText(
              text: ' $subtitle',
              overflow: TextOverflow.visible,
              textAlign: TextAlign.left,
            )),
      ],
    );
  }
}
