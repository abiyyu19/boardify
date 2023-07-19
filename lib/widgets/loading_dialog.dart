import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utils/constant.dart';

Future<dynamic> loadingWidget(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return const SpinKitCircle(
        size: 100,
        color: mainBlue,
      );
    },
  );
}
