import 'package:ecampusv2/app/modules/drawerPage/controllers/drawer_page_controller.dart';
import 'package:ecampusv2/app/routes/app_pages.dart';
import 'package:ecampusv2/env.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MenuScreenView extends GetView<DrawerPageController> {
  const MenuScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlue,
        child: Column(children: [
          const SizedBox(
            height: 50,
          ),
          CircleAvatar(
            radius: 60,
            foregroundImage: NetworkImage(
                '$profilUrl/${controller.currentCompte.etudiant?.avatar}'),
          ),
          ListTile(
            title: const Text(
              'Contacter l\'assistance',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            leading: const Icon(Icons.phone, color: Colors.white),
            trailing: const Icon(Icons.arrow_right, color: Colors.white),
            onTap: () {
              Get.toNamed(Routes.ASSISTANCE);
            },
          ),
          const Divider(height: 4, color: Colors.brown),
          ListTile(
              title: const Text(
                'Modifier votre code secret',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              leading: const Icon(Icons.edit, color: Colors.white),
              trailing: const Icon(Icons.arrow_right, color: Colors.white),
              onTap: () {}),
          const Divider(height: 4, color: Colors.brown),
          ListTile(
            title: const Text(
              'Se déconnecter',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            leading: const Icon(Icons.logout, color: Colors.white),
            trailing: const Icon(Icons.arrow_right, color: Colors.white),
            onTap: () {
              Get.defaultDialog(
                  onConfirm: () => controller.logout(),
                  middleText: "Voulez-vous vraiment vous deconnecter ?");
            },
          ),
        ]),
      ),
    );
  }
}
