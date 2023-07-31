import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pinput/pinput.dart';

import '../controllers/password_update_controller.dart';

class PasswordUpdateView extends GetView<PasswordUpdateController> {
  const PasswordUpdateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Modification du Code Secret'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => controller.isLoading.value
                  ? const Center(
                      child: GFLoader(
                        type: GFLoaderType.custom,
                        child: SpinKitDoubleBounce(
                          color: Colors.lightBlue,
                          size: 50.0,
                        ),
                      ),
                    )
                  : const Text('')),
              const SizedBox(
                height: 10,
              ),
              const Image(
                image: AssetImage("assets/password.png"),
                height: 200,
                width: 200,
              ),
              const Text(
                "CODE SECRET ACTUEL",
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
                onCompleted: (pin) => controller.oldPass(pin),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "NOUVEAU CODE SECRET",
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
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                onCompleted: (pin) => controller.password(pin),
              ),
              const SizedBox(
                height: 20,
              ),
              GFButton(
                onPressed: () {
                  controller.changePassword();
                },
                blockButton: true,
                size: GFSize.LARGE,
                elevation: 2,
                color: Colors.lightBlue,
                child: const Text(
                  'VALIDER LE CHANGEMENT',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
