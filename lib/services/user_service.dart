import 'package:learn_testing/client/api_client.dart';

class UserService {
  final ApiClient apiClient;
  UserService({required this.apiClient});

  Future<String> getUser(int id) async {
    try {
      final user = await apiClient.fetchUserById(id);
      return user;
    } catch (e) {
      return 'Failed to load user';
    }
  }
}
