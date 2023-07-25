import 'package:dio/dio.dart';
import 'package:mimir/models/login_response.dart';

bool isValidUrl(String input) {
  // Regular expression to validate URLs (supports IP addresses and optional HTTP/HTTPS)
  RegExp urlRegex = RegExp(
    r'^(https?://)?' // Optional HTTP/HTTPS
    r'(?:(?:[0-9]{1,3}\.){3}[0-9]{1,3}|' // IP address
    r'(?:[a-zA-Z0-9.-]+(?:\.[a-zA-Z]{2,})+))' // Domain name
    r'(?::\d+)?' // Optional port number
    r'(?:\/\S*)?$', // Optional path
    caseSensitive: false, // Case-insensitive match
  );

  return urlRegex.hasMatch(input);
}

class HTTPClient {
  HTTPClient({required this.dio});

  Dio dio;
  String base = "";

  void setBase(String base) {
    this.base = base;
  }

  Future<bool> validateServerAddress(String serverAddress) async {
    if (!isValidUrl(serverAddress)) {
      return false;
    }

    // Sanitize server address

    // Remove trailing slash
    if (serverAddress.endsWith("/")) {
      serverAddress = serverAddress.substring(0, serverAddress.length - 1);
    }

    // Add http:// if not present
    if (!serverAddress.startsWith("http://") &&
        !serverAddress.startsWith("https://")) {
      serverAddress = "http://$serverAddress";
    }

    Response response;
    try {
      response = await dio.get("$serverAddress/ping");
    } catch (e) {
      return false;
    }

    if (response.statusCode == 200) {
      setBase(serverAddress);
      return true;
    }

    return false;
  }

  Future<LoginResponse?> login({
    String? username,
    String? password,
    String? apiKey,
  }) async {
    // username and password OR apiKey must be provided

    if (username == null && password == null && apiKey == null) {
      return null;
    }

    Response response;
    try {
      if (apiKey != null) {
        response = await dio.post(
          "$base/api/authorize",
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $apiKey",
            },
          ),
        );
      } else {
        response = await dio.post(
          "$base/login",
          data: {
            "username": username,
            "password": password,
          },
        );
      }
    } catch (e) {
      return null;
    }

    if (response.statusCode == 200) {
      return LoginResponse.fromMap(response.data);
    }

    return null;
  }
}
