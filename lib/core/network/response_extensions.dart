import 'package:http/http.dart';
import 'package:pilem/core/basic_extensions/number_extensions.dart';

extension ResponseExt on Response {
  bool get isSuccess {
    return statusCode.inRange(200, 299);
  }

  bool get isClientError {
    return statusCode.inRange(400, 499);
  }

  bool get isServerError {
    return statusCode.inRange(500, 599);
  }

  bool get isError => isClientError || isServerError;
}
