import "package:dio/dio.dart";
import "package:mimir/services/http/http.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
part "http_service.g.dart";

@Riverpod(keepAlive: true)
Dio dio(DioRef ref) {
  return Dio(
    BaseOptions(
      validateStatus: (status) => true,
      receiveDataWhenStatusError: true,
    ),
  );
}

@Riverpod(keepAlive: true)
HTTPClient httpClient(HttpClientRef ref) {
  return HTTPClient(dio: ref.watch(dioProvider));
}
