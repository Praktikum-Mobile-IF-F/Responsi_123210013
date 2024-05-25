import 'base_network.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  Future<Map<String, dynamic>> loadDataKopi() {
    return BaseNetwork.get("api");
  }
}
