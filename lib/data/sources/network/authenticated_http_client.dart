import 'package:http/http.dart';

class AuthenticatedHttpClient extends BaseClient {
  AuthenticatedHttpClient({
    Client? innerClient,
  }) : _innerClient = innerClient ?? Client();

  final Client _innerClient;

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    return _innerClient.send(request);
  }
}
