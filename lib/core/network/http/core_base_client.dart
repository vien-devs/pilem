import 'package:http/http.dart';

/// Simple [Client] wrapper/decorator to add network event bus
class CoreBaseClient extends BaseClient {
  final Client _inner;

  CoreBaseClient(this._inner);

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    return _inner.send(request).then((streamedResponse) {
      final statusCode = streamedResponse.statusCode;
      switch (statusCode) {
        case 401:
        case 403:
          break;
        default:
          break;
      }
      return streamedResponse;
    });
  }

  @override
  void close() {
    _inner.close();
  }
}
