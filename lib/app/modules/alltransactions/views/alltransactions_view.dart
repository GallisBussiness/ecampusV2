import 'package:ecampusv2/app/modules/transaction/operation_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../controllers/alltransactions_controller.dart';

class AlltransactionsView extends GetView<AlltransactionsController> {
  const AlltransactionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes Transactions'),
        centerTitle: true,
      ),
      body: LiquidPullToRefresh(
        color: Colors.lightBlue,
        onRefresh: () async {
          controller.load();
        },
        child: Container(
          child: controller.obx(
            (state) => ListView.separated(
                separatorBuilder: (context, i) =>
                    const Divider(color: Colors.lightBlue, height: 20),
                itemCount: state!.length,
                itemBuilder: (context, i) {
                  Operation? op = state[i];
                  return ListTile(
                    dense: true,
                    leading: op?.type == "DPT"
                        ? const CircleAvatar(
                            backgroundColor: Colors.lightBlue,
                            child: Icon(
                              Icons.get_app,
                              color: Colors.white,
                            ))
                        : const CircleAvatar(
                            backgroundColor: Colors.lightBlue,
                            child: Icon(Icons.outbond, color: Colors.white)),
                    subtitle: Text(
                        "${DateFormat.yMd().format(DateTime.parse(op!.createdAt!))} à ${DateFormat.Hms().format(DateTime.parse(op.createdAt!))}",
                        style: const TextStyle(color: Colors.grey)),
                    title: op.payementSubject != null
                        ? Text(
                            "${op.description} pour ${op.payementSubject?.nom} au service ${op.payementSubject?.service?.nom}",
                            style: const TextStyle(fontSize: 16))
                        : Text(op.description!,
                            style: const TextStyle(fontSize: 16)),
                    trailing: Text("${op.montant} FCFA",
                        style: const TextStyle(fontSize: 14)),
                  );
                }),
            onLoading: const Center(child: CircularProgressIndicator()),
            onError: null,
          ),
        ),
      ),
    );
  }
}
