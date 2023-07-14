import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: GFLoader(
          type: GFLoaderType.custom,
          child: SpinKitFoldingCube(
            color: Colors.lightBlue,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}
