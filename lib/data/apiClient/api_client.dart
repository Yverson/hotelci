import 'package:get/get.dart';

class ApiClient extends GetConnect {
  ApiClient._internal();

  factory ApiClient() {
    return _apiClient;
  }

  static final ApiClient _apiClient = ApiClient._internal();
}
