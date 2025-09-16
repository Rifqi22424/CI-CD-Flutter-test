import 'package:flutter_test/flutter_test.dart';
import 'package:learn_testing/client/api_client.dart';
import 'package:learn_testing/services/user_service.dart';
import 'package:mocktail/mocktail.dart';

class MockApiClient extends Mock implements ApiClient {}

void main() {
  late UserService userService;
  late ApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockApiClient();
    userService = UserService(apiClient: mockApiClient);
  });

  // it should return a valid user
  test('it should return a valid user', () async {
    // arrange: program the mock using when()
    when(
      () => mockApiClient.fetchUserById(123),
    ).thenAnswer((_) async => 'Jhon');
    // act try the service to use the mock
    final user = await userService.getUser(123);
    // assert check the result if the data is actually shown
    expect(user, 'Jhon');
    // call the mock, and check if already used once
    verify(() => mockApiClient.fetchUserById(123)).called(1);
  });

  test('it should return a throw failed to load user', () async {
    when(
      () => mockApiClient.fetchUserById(any()),
    ).thenThrow(Exception('Network Error'));

    final user = await userService.getUser(123);

    expect(user, 'Failed to load user');
  });
}
