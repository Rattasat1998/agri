import 'package:flutter/material.dart';

class StatusColors {
  Color getColor(int status) {

    Color yellow =  const Color(0xffB18001);

    switch (status) {
      case 1:
        return Colors.grey.shade500;
      case 2:
        return yellow;
      case 3:
        return yellow;
      case 4:
        return yellow;
      case 5:
        return Colors.green;
      case 6:
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}
