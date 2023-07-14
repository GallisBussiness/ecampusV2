import 'package:ecampusv2/env.dart';
import 'package:get/get.dart';

import '../operation_model.dart';

class OperationProvider extends GetConnect {
  @override
  void onInit() {}

  Future<List<Operation?>> getLatestOperations(String id) async {
    final response = await get('$backUrl/operation/compte/latest/$id');
    List<dynamic> body = response.body;
    return body.map((b) => Operation.fromJson(b)).toList();
  }

  Future<List<Operation?>> getOperations(String id) async {
    final response = await get('$backUrl/operation/compte/$id');
    List<dynamic> body = response.body;
    return body.map((b) => Operation.fromJson(b)).toList();
  }
}
