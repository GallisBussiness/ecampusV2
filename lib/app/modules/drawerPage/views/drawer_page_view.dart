import 'package:ecampusv2/app/modules/acceuil/views/acceuil_view.dart';
import 'package:ecampusv2/app/modules/drawerPage/views/menu_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:get/get.dart';

import '../controllers/drawer_page_controller.dart';

class DrawerPageView extends GetView<DrawerPageController> {
  const DrawerPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DrawerPageController>(
      builder: (_) => ZoomDrawer(
        controller: _.zoomDrawerController,
        menuScreen: const MenuScreenView(),
        mainScreen: AcceuilView(),
        borderRadius: 24.0,
        showShadow: true,
        menuBackgroundColor: Colors.white,
        angle: -12.0,
        drawerShadowsBackgroundColor: Colors.grey,
        slideWidth: MediaQuery.of(context).size.width * 0.80,
      ),
    );
  }
}
