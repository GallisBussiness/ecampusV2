import 'package:ecampusv2/app/modules/transaction/operation_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/transaction_controller.dart';

class TransactionView extends GetView<TransactionController> {
  const TransactionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
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
              onError: (err) =>
                  const Image(image: AssetImage("assets/empty.png")),
            ),
          ),
        ),
      ],
    );
  }
}
