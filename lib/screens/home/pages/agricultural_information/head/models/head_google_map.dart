import 'package:agri/screens/home/pages/agricultural_information/bloc/agricultural_information_bloc.dart';
import 'package:agri/utils/custom_google_map_widget.dart';
import 'package:agri/utils/themes.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HeadGoogleMap extends StatefulWidget {
  final Function(CameraPosition)? onCameraMove;
  final Function()? onCameraIdle;
  final CameraPosition initialCameraPosition;

  const HeadGoogleMap({
    super.key,
    this.onCameraMove,
    this.onCameraIdle,
    required this.initialCameraPosition,
  });

  @override
  State<HeadGoogleMap> createState() => _HeadGoogleMapState();
}

class _HeadGoogleMapState extends State<HeadGoogleMap> {
  final SearchController controller = SearchController();
  String currentAddress = '';
  late CameraPosition initialCameraPosition;

  Future<String?> getAddressFromLocation(LatLng latLng) async {
    // From coordinates
    List<Placemark> placemarks = await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    Placemark place = placemarks[0];
    return place.name;
  }

  void _onCameraMove(CameraPosition position) async {

    setState(() {
      print(currentAddress);
      initialCameraPosition = position;

      //currentAddress = current ?? '';


      //_controller.animateCamera(CameraUpdate.newCameraPosition(position));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialCameraPosition = widget.initialCameraPosition;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButtonWidget(),
      ),
      body: BlocBuilder<AgriculturalInformationBloc, AgriculturalInformationState>(
        builder: (context, state) {
          if (state is AgriculturalInformationLoaded) {
            return Stack(
              children: [
                CustomGoogleMapWidget(
                  onMapCreated: (controller) {},
                  initialCameraPosition: initialCameraPosition,
                  // markers: state.markers,
                  scrollGesturesEnabled: true,
                  onCameraMove: (p){
                    _onCameraMove(p);
                    widget.onCameraMove!(p);
                  },
                  onCameraIdle: () async {
                    await Future.delayed(const Duration(milliseconds: 100));
                    final String? current = await getAddressFromLocation(
                        LatLng(initialCameraPosition.target.latitude, initialCameraPosition.target.longitude));
                    setState(() {
                      currentAddress = current ?? '';
                      print(currentAddress);
                    });
                  },
                ),
                const Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    top: 0,
                    child: Icon(
                      Icons.place,
                      color: Colors.red,
                      size: 40,
                    )),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(16),
                      //margin: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const CustomText(
                                text: 'ที่ตั้ง : ',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.left,
                              ),
                              const Spacer(),
                              CupertinoButton(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  color: ThemeConfig.subPrimary,
                                  child: const CustomText(
                                    text: 'ตกลง',
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    Get.back();
                                  }),
                            ],
                          ),
                          CustomText(
                            text: currentAddress ?? '',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      )),
                ),
                /*Positioned(
                  top: 80,
                  left: 10,
                  right: 10,
                  child: Builder(
                    builder: (context) {
                      return SearchAnchor.bar(
                        isFullScreen: true,
                        onChanged: (v) {
                          context.read<AgriculturalInformationBloc>().add(HeadSearchAddressEvent(query: v));
                          setState(() {});
                        },
                        onSubmitted: (v) {
                          context.read<AgriculturalInformationBloc>().add(HeadSearchAddressEvent(query: v));
                          setState(() {});
                        },
                        suggestionsBuilder: (BuildContext context, SearchController controller) {
                          return state.addressList.map((address) {
                            return ListTile(
                              title: Text(address),
                              onTap: () {
                                controller.text = address;
                                context.read<AgriculturalInformationBloc>().add(HeadSearchAddressEvent(query: address));
                              },
                            );
                          });
                        },




                      );
                    }
                  ),
                ),*/
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
