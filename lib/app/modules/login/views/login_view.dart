// import 'package:ecampusv2/app/routes/app_pages.dart';
import 'package:ecampusv2/app/routes/app_pages.dart';
// import 'package:ecampusv2/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
// import 'package:getwidget/getwidget.dart';
// import 'package:getwidget/getwidget.dart';
import 'package:qr_flutter/qr_flutter.dart';
// import 'package:getwidget/getwidget.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
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
        const Image(image: AssetImage("assets/logo2.jpeg")),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () async {
            var res = await Get.toNamed(Routes.QRSCAN);
            controller.code(res['code']);
            controller.password(res['pass']);
            if (res['pass'] != "") {
              controller.login();
            }
          },
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 224, 248, 244),
                  borderRadius: BorderRadius.circular(200)),
              height: 200,
              width: 200,
              child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.lightBlue),
                  child: QrImageView(
                    data: 'logintoecampus',
                    size: 150,
                    eyeStyle: const QrEyeStyle(color: Colors.white),
                  )),
            ),
          ),
        ),
        // const SizedBox(
        //   height: 10,
        // ),
        // Container(
        //   margin: const EdgeInsets.symmetric(horizontal: 20),
        //   child: const TextField(
        //       onChanged: null,
        //       obscureText: true,
        //       decoration: InputDecoration(
        //           prefixIcon: Icon(Icons.security),
        //           labelText: "Mot de passe",
        //           hintText: "Entrer le mot de passe",
        //           border: OutlineInputBorder())),
        // ),
        // const SizedBox(
        //   height: 20,
        // ),
        // Center(
        //   child: GFButton(
        //     onPressed: () => {},
        //     text: "SE CONNECTER",
        //     blockButton: true,
        //     fullWidthButton: true,
        //   ),
        // ),
        const SizedBox(
          height: 20,
        ),
        const Text("TAPER SUR LE CODE QR POUR VOUS CONNECTER ")
      ],
    ));
  }
}
