import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrscanController extends GetxController {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String? result;
  QRViewController? controller;

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      result = scanData.code;
      controller.pauseCamera();
      if (result is String) {
        String? pass = await Get.bottomSheet(
          Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GFTextFieldRounded(
                    cornerradius: 5,
                    onFieldSubmitted: (value) {
                      Get.back(result: value);
                    },
                    editingbordercolor: Colors.brown,
                    idlebordercolor: Colors.lightBlue,
                    borderwidth: 2,
                    autofocus: true,
                    obscureText: true,
                    backgroundcolor: Colors.white,
                    hintText: "Entrer votre mot de passe"),
              ),
              const SizedBox(
                height: 10,
              ),
              const Image(image: AssetImage("assets/logo2.jpeg"), height: 50),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 2,
        );
        Get.back(result: {"code": result, "pass": pass});
      } else {
        Get.snackbar("Scan message", "Le Scan a echoue !",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    if (controller != null) {
      if (Platform.isAndroid) {
        controller!.pauseCamera();
      } else if (Platform.isIOS) {
        controller!.resumeCamera();
      }
    }
  }

  @override
  void onClose() {
    controller?.dispose();

    super.onClose();
  }
}
