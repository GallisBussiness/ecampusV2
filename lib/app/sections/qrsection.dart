import 'package:ecampusv2/app/data/models/compte_model.dart';
import 'package:ecampusv2/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrSection extends StatelessWidget {
  const QrSection({Key? key, required this.compte}) : super(key: key);
  final Compte compte;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: 200,
          width: 200,
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(200),
          ),
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: InkWell(
              onTap: () {
                Get.toNamed(Routes.QRPAGE);
              },
              child: Hero(
                tag: "qr_code",
                child: QrImageView(
                  data: compte.code!,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              ),
            ),
          )),
    );
  }
}
