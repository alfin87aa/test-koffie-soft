import '../../index.dart';

FutureOr<dynamic> responseInterceptor(
    Request request, Response response) async {
  EasyLoading.dismiss();

  if (response.statusCode != 200) {
    handleErrorStatus(response);
    return;
  }

  return response;
}

void handleErrorStatus(Response response) {
  EasyLoading.dismiss();

  final message = ErrorResponse.fromJson(response.body['status']);
  Get.snackbar(
    message.kode,
    message.keterangan,
    backgroundColor: Colors.white,
    margin: const EdgeInsets.only(top: 50.0),
    duration: const Duration(seconds: 1),
  );

  return;
}
