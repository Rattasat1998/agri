import 'package:agri/widgets/back_button_widget.dart';
import 'package:flutter/material.dart';

class ConclusionBluePrint extends StatelessWidget {
  final Widget body;
   ConclusionBluePrint({super.key,required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: body,
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 80,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: const BackButtonWidget(),
    );
  }
}
