import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final String title;
  const CustomTab({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
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
                  child: CustomText(text: '$titleทั้งหมด'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
