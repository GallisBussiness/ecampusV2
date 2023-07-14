import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../controllers/qrscan_controller.dart';

class QrscanView extends GetView<QrscanController> {
  const QrscanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Scann du Qr code'),
          centerTitle: true,
        ),
        body: Scaffold(
          body: Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: QRView(
                  key: controller.qrKey,
                  overlay: QrScannerOverlayShape(
                    borderColor: Colors.lightBlue,
                    borderWidth: 2,
                  ),
                  onQRViewCreated: controller.onQRViewCreated,
                ),
              ),
              Expanded(
                flex: 1,
                child: Wrap(
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.controller?.toggleFlash();
                      },
                      icon: const Icon(Icons.flash_on,
                          size: 32, color: Colors.lightBlue),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.controller?.flipCamera();
                      },
                      icon: const Icon(Icons.camera,
                          size: 32, color: Colors.lightBlue),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
