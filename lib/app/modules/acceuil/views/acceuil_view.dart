import 'package:ecampusv2/app/modules/drawerPage/controllers/drawer_page_controller.dart';
import 'package:ecampusv2/app/modules/transaction/controllers/transaction_controller.dart';
import 'package:ecampusv2/app/modules/transaction/views/transaction_view.dart';
import 'package:ecampusv2/app/sections/qrsection.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../controllers/acceuil_controller.dart';

class AcceuilView extends GetView<AcceuilController> {
  AcceuilView({Key? key}) : super(key: key);
  final TransactionController transactionController =
      Get.put(TransactionController());
  final DrawerPageController drawerPageController =
      Get.put(DrawerPageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              drawerPageController.toggleDrawer();
            },
          ),
          title: Text(
              '${controller.compte.etudiant?.prenom} ${controller.compte.etudiant?.nom}'),
          centerTitle: true,
        ),
        body: LiquidPullToRefresh(
          color: Colors.lightBlue,
          onRefresh: () async {
            await controller.load();
            transactionController.load();
          },
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.brown,
                  ),
                  child: Obx(() => Row(
                        children: [
                          const Text(
                            'Solde :',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Center(
                            child: controller.isSoldeShow.value
                                ? Text(
                                    "${controller.compte.solde} FCFA",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : const Text('***********',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    )),
                          ),
                        ],
                      )),
                ),
                Obx(() => Center(
                    child: controller.isSoldeShow.value
                        ? IconButton(
                            icon: const FaIcon(
                              FontAwesomeIcons.eyeSlash,
                              color: Colors.lightBlue,
                            ),
                            onPressed: controller.hideSolde,
                          )
                        : IconButton(
                            icon: const FaIcon(FontAwesomeIcons.eye),
                            onPressed: controller.showSolde,
                          )))
              ]),
              const SizedBox(
                height: 5,
              ),
              QrSection(compte: controller.compte),
              const SizedBox(
                height: 10,
              ),
              const Expanded(child: TransactionView()),
            ],
          ),
        ));
  }
}
