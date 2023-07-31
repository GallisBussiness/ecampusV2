import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrscanController extends GetxController {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String? result;
  QRViewController? controller;

  void onQRViewCreated(QRViewController controller) {
    final defaultPinTheme = PinTheme(
      width: 48,
      height: 48,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
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
              const Text(
                "ENTRER VOTRE CODE SECRET",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Pinput(
                length: 6,
                autofocus: true,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                onCompleted: (pin) {
                  Get.back(result: pin);
                },
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
