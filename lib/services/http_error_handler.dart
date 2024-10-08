import 'package:http/http.dart' as http;

String httpErrorHandler(http.Response response) {
  final statusCode = response.statusCode;
  final reasonPhrase = response.reasonPhrase;

  final String errorMessage =
      "Request failed \n Status Code : $statusCode \n Reason : $reasonPhrase";

  return errorMessage;
}
