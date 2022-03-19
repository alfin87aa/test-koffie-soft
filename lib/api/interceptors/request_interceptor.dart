import '../../index.dart';

FutureOr<Request> requestInterceptor(request) async {
  final prefs = Get.find<SharedPreferences>();
  final token = prefs.getString(StorageConstants.token);

  request.headers['X-Requested-With'] = 'XMLHttpRequest';
  request.headers['Authorization'] = 'Bearer $token';

  EasyLoading.show(status: 'loading...');
  return request;
}
