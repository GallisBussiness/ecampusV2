import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../controllers/qrpage_controller.dart';

class QrpageView extends GetView<QrpageController> {
  const QrpageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon Code QR'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
            height: 300,
            width: 300,
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(200),
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Hero(
                tag: "qr_code",
                child: QrImageView(
                  data: controller.compte.code!,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              ),
            )),
      ),
    );
  }
}
