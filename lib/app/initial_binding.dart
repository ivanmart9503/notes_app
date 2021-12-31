import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:notes/app/core/constants/constants.dart';
import 'package:notes/app/data/provider/api_provider.dart';
import 'package:notes/app/modules/profile/profile_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> initialBinding() async {
  final dio = Dio(
    BaseOptions(
      baseUrl: serverUrl,
      responseType: ResponseType.json,
      contentType: 'application/json; charset=utf-8',
      validateStatus: (status) => status! <= 500,
      headers: {
        'Accept': 'application/json; charset=utf-8',
      },
    ),
  );

  dio.interceptors.add(TokenInterceptor());

  Get.put<Dio>(dio, permanent: true);
  await Get.putAsync(
    () async => await SharedPreferences.getInstance(),
    permanent: true,
  );

  Get.put<ApiProvider>(
    ApiProvider(
      http: Get.find<Dio>(),
      prefs: Get.find<SharedPreferences>(),
    ),
    permanent: true,
  );

  Get.put<ProfileController>(
    ProfileController(
      api: Get.find<ApiProvider>(),
      prefs: Get.find<SharedPreferences>(),
    ),
    permanent: true,
  );
}

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = Get.find<SharedPreferences>().getString('token');

    if (token != null) {
      options.headers.addAll({'Authorization': 'Bearer $token'});
    }

    return super.onRequest(options, handler);
  }
}
