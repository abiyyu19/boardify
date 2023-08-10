import 'package:boardify/utils/constant.dart';
import 'package:flutter/material.dart';

Color showColorPriority(String priority) {
  if (priority == 'Rendah') {
    return Colors.green;
  } else if (priority == 'Sedang') {
    return Colors.yellow;
  } else {
    return Colors.red;
  }
}

Color showColorStatus(String status) {
  if (status == 'Menunggu') {
    return grayHehe;
  } else if (status == 'Dikerjakan') {
    return mainBlue;
  } else {
    return tosca;
  }
}
