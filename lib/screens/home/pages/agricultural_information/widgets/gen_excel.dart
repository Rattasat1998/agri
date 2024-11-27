import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:agri/screens/home/pages/agricultural_information/widgets/save_file_mobile.dart';
import 'package:agri/utils/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../utils/local_storage.dart';

class ExcelGeneration extends StatefulWidget {
  final int groupId;

  const ExcelGeneration({super.key, required this.groupId});

  @override
  _ExcelGenerationState createState() => _ExcelGenerationState();
}

class _ExcelGenerationState extends State<ExcelGeneration> {
  final WebViewController controller = WebViewController();

  final Map information = {};
  final List machines_list = [];
  final List member_list = [];
  final Map address = {};
  bool isLoading = false;
  bool pageLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageLoading = true;
    fetchData();
  }

  final baseImageUrl = 'https://agri-app.extremesofts.com/';

  Future<void> fetchData() async {
    final token = await LocalStorage.getToken();
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
    Uri uri = Uri.parse(
        'https://agri-app.extremesofts.com/api/group/for-admin/data-download/group/${widget.groupId.toString()}');

    final response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = await jsonDecode(response.body);
      information.addAll(data['data']['information']);
      machines_list.addAll(data['data']['machines_list']);
      member_list.addAll(data['data']['member_list']);
      address.addAll(data['data']['address']);
      pageLoading = false;
      setState(() {});
    } else {
      throw Exception('Failed to load data');
    }
  }

  final Workbook workbook = Workbook();
  final Worksheet sheet = Workbook().worksheets[0];
  int currentCell = 1;
  final Completer<GoogleMapController> _mapController = Completer<GoogleMapController>();

  Uint8List? imageBytes;
  File? file;

  Future<void> generateExcel(Function(double) updateProgress) async {
    // Calculate the total number of steps in the process
    int totalSteps = machines_list.length + member_list.length + 5; // Add 5 for additional steps
    bool isMap = address['latitude'] == null;
    try {
      setState(() {
        isLoading = true;
      });
      //Creating a workbook.
      final Workbook workbook = Workbook();
      //Accessing via index
      final Worksheet sheet = workbook.worksheets[0];
      sheet.showGridlines = true;

      sheet.enableSheetCalculations();

      sheet.getRangeByName('A1').columnWidth = 20;
      updateProgress(currentCell / totalSteps);
      sheet.getRangeByName('B1').columnWidth = 25;
      updateProgress(currentCell / totalSteps);
      sheet.getRangeByName('C1').columnWidth = 25;
      updateProgress(currentCell / totalSteps);
      sheet.getRangeByName('B4').rowHeight = 50;
      updateProgress(currentCell / totalSteps);
      sheet.getRangeByName('A1:C1').cellStyle.backColor = '#333F4F';
      updateProgress(currentCell / totalSteps);
      final Range range1 = sheet.getRangeByName('A2:B2');

      range1.merge();
      updateProgress(currentCell / totalSteps);
      sheet.getRangeByName('A2').setText('ข้อมูลกลุ่มเกษตรกร');
      updateProgress(currentCell / totalSteps);
      range1.cellStyle.fontSize = 16;
      range1.cellStyle.bold = true;
      range1.cellStyle.hAlign = HAlignType.center;

      sheet.getRangeByName('A3').setText('ชื่อกลุ่ม :');
      sheet.getRangeByName('B3').setText(information['group_name']);
      updateProgress(currentCell / totalSteps);
      sheet.getRangeByName('A4').setText('รูปกลุ่ม :');

      if (information['group_img'] != null) {
        final b = await http.get(Uri.parse(baseImageUrl + information['group_img']));
        final Picture picture = sheet.pictures.addStream(4, 2, b.bodyBytes);
        picture.width = 65;
        picture.height = 65;
      }
      updateProgress(currentCell / totalSteps);
      //sheet.getRangeByName('B4').setText(information['group_img']);
      sheet.getRangeByName('A5').setText('จำนวนสมาชิกกลุ่ม : ');
      sheet.getRangeByName('B5').setText('${information['users_count']} คน');
      updateProgress(currentCell / totalSteps);
      sheet.getRangeByName('A6').setText('รถไถทั้งหมด : ');
      sheet.getRangeByName('B6').setText('${information['machine_count']} คัน');
      updateProgress(currentCell / totalSteps);
      sheet.getRangeByName('A7').setText('จำนวนพื้นที่นาในกลุ่ม : ');
      sheet.getRangeByName('B7').setText('${information['group_fields']} ไร่');
      updateProgress(currentCell / totalSteps);
      // Merge cells
      final Range range2 = sheet.getRangeByName('A9:C9');

      range2.merge();

      sheet.getRangeByName('A9').setText('รายการรถไถในกลุ่ม');
      range2.cellStyle.fontSize = 16;
      range2.cellStyle.bold = true;
      range2.cellStyle.hAlign = HAlignType.center;
      updateProgress(currentCell / totalSteps);
      sheet.getRangeByName('A10').setText('รูป');
      updateProgress(currentCell / totalSteps);
      sheet.getRangeByName('B10').setText('ชื่อ');
      updateProgress(currentCell / totalSteps);
      sheet.getRangeByName('C10').setText('เจ้าของ');
      currentCell = 10;
      updateProgress(currentCell / totalSteps);
      for (int i = 0; i < machines_list.length; i++) {
        if (machines_list[i]['machine_img'] != null) {
          final b = await http.get(Uri.parse(baseImageUrl + machines_list[i]['machine_img']));
          final Picture picture = sheet.pictures.addStream(i + 11, 1, b.bodyBytes);
          picture.width = 65;
          picture.height = 65;
        }

        sheet.getRangeByIndex(i + 11, 1).rowHeight = 50;
        //sheet.getRangeByIndex(i + 11, 1).setText('${i + 1}');
        sheet.getRangeByIndex(i + 11, 2).setText('${machines_list[i]['machine_name']}');
        sheet.getRangeByIndex(i + 11, 3).setText('${machines_list[i]['user']}');
        currentCell++;
        updateProgress(currentCell / totalSteps);
      }

      // Merge cells
      currentCell += 2;
      updateProgress(currentCell / totalSteps);
      final Range range3 = sheet.getRangeByName('A$currentCell:C$currentCell');

      range3.merge();

      sheet.getRangeByName('A$currentCell').setText('รายชื่อสมาชิกกลุ่ม');
      range3.cellStyle.fontSize = 16;
      range3.cellStyle.bold = true;
      range3.cellStyle.hAlign = HAlignType.center;

      currentCell += 1;
      updateProgress(currentCell / totalSteps);
      sheet.getRangeByName('A$currentCell').setText('รูป');

      sheet.getRangeByName('B$currentCell').setText('ชื่อ');

      sheet.getRangeByName('C$currentCell').setText('พื้นที่นา');

      final mCell = currentCell;
      for (int i = 0; i < member_list.length; i++) {
        if (member_list[i]['profile_img'] != null) {
          final b = await http.get(Uri.parse(baseImageUrl + member_list[i]['profile_img']));
          final Picture picture = sheet.pictures.addStream(i + mCell, 1, b.bodyBytes);
          picture.width = 65;
          picture.height = 65;
        }
        sheet.getRangeByIndex(i + mCell, 1).rowHeight = 50;
        sheet.getRangeByIndex(i + mCell, 2).setText('${member_list[i]['firstname']}');
        sheet.getRangeByIndex(i + mCell, 3).setText('${member_list[i]['number_fields']} ไร่');
        currentCell++;
        updateProgress(currentCell / totalSteps);
      }

      // Merge cells
      currentCell += 2;
      updateProgress(currentCell / totalSteps);
      final Range range4 = sheet.getRangeByName('A$currentCell:C$currentCell');
      range4.merge();
      sheet.getRangeByName('A$currentCell').setText('รายละเอียดกลุ่มเกษตรกร');
      range4.cellStyle.fontSize = 16;
      range4.cellStyle.bold = true;
      range4.cellStyle.hAlign = HAlignType.center;

      currentCell += 1;
      updateProgress(currentCell / totalSteps);
      sheet.getRangeByName('A$currentCell').setText('ที่อยู่ : ');
      sheet.getRangeByName('B$currentCell').setText('${address['group_address']}');

      currentCell += 1;
      updateProgress(currentCell / totalSteps);
      sheet.getRangeByName('A$currentCell').setText('รายละเอียด : ');
      sheet.getRangeByName('B$currentCell').setText('${address['description']}');

      currentCell += 1;
      updateProgress(currentCell / totalSteps);
      sheet.getRangeByName('A$currentCell').setText('เบอร์ติดต่อ : ');
      sheet.getRangeByName('B$currentCell').setText('${address['group_tel']}');

      currentCell += 2;
      /*final Range range5 = sheet.getRangeByName('A$currentCell:C$currentCell');
          range5.merge();*/
      if(isMap){
      sheet.getRangeByName('A$currentCell').setText('แผนที่');
      }
      /*range5.cellStyle.fontSize = 16;
          range5.cellStyle.bold = true;
          range5.cellStyle.hAlign = HAlignType.center;*/

      //print(file!.path);
      currentCell += 1;
      updateProgress(currentCell / totalSteps);
      //final List<int> mapByte = File(file!.path).readAsBytesSync();

       Picture mapPic;
      if(isMap){
        mapPic = sheet.pictures.addStream(currentCell, 1, imageBytes!);
        mapPic.width = 180;
        mapPic.height = 180;
      }

      updateProgress(currentCell / totalSteps);
      sheet.getRangeByIndex(26, 1);
      sheet.getRangeByIndex(26, 1).cellStyle.fontSize = 8;
      updateProgress(currentCell / totalSteps);
      final List<int> bytes = workbook.saveAsStream();
      //Dispose the document.
      workbook.dispose();
      setState(() {
        isLoading = false;
        progress = 0.0;
      });
      //Save and launch the file.
      await saveAndLaunchFile(bytes, 'form-excel.xlsx');
    } catch (e, t) {
      print(e);
      print(t);
    }
  }

  void takeSnapShot() async {
    GoogleMapController controller = await _mapController.future;
    Future<void>.delayed(const Duration(milliseconds: 1000), () async {
      imageBytes = await controller.takeSnapshot();
      print(imageBytes);
      setState(() {});
    });
  }

  double progress = 0.0;

  void generateExcelAndUpdateProgress() {
    // Function to update progress
    void updateProgress(double value) {
      setState(() {
        progress = value;
      });
    }

    generateExcel(updateProgress);
  }

  @override
  Widget build(BuildContext context) {
    print(address['latitude']);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ดาวน์โหลดไฟล์ Excel',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            pageLoading
                ? SizedBox()
                : address['latitude'] != null
                    ? SizedBox()
                    : Visibility(
                        child: SizedBox(
                          height: 300,
                          child: GoogleMap(
                              markers: {
                                Marker(
                                    markerId: const MarkerId('1'),
                                    position: LatLng(address['latitude'], address['longitude']),
                                    infoWindow: InfoWindow(
                                        title: address['group_name'],
                                        snippet: address['group_address']))
                              },
                              initialCameraPosition: CameraPosition(
                                  target: LatLng(address['latitude'], address['longitude']),
                                  zoom: 14),
                              onMapCreated: (controller) {
                                _mapController.complete(controller);
                                takeSnapShot();
                              }),
                        ),
                      ),
            const SizedBox(height: 20),
            const Text(
              'คุณต้องการดาวน์โหลดไฟล์ Excel ใช่หรือไม่?',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 20),
            CupertinoButton(
              color: ThemeConfig.subPrimary,
              onPressed: isLoading
                  ? null
                  : () {
                      generateExcelAndUpdateProgress();
                      //screenShotGoogleMap();
                      //fetchData();
                    },
              child: isLoading
                  ? CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 2,
                      strokeCap: StrokeCap.round,
                      backgroundColor: Colors.white,
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                    )
                  : const Text('ดาวน์โหลดไฟล์ Excel'),
            ),
          ],
        ),
      ),
    );
  }
}
