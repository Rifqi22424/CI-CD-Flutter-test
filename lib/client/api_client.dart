class ApiClient {
  Future<String> fetchUserById(int id) async {
    await Future.delayed(Duration(seconds: 2));
    return 'Rifqi';
  }
}
