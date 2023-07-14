import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/assistance_controller.dart';

class AssistanceView extends GetView<AssistanceController> {
  const AssistanceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Assistance'),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: const Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text("Email"),
                  Spacer(),
                  Text("bussinessgallis@gmail.com")
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text("Téléphone"),
                  Spacer(),
                  Text("(221) 77 926 57 36")
                ],
              ),
            ],
          ),
        ));
  }
}
