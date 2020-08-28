import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

enum RequestType { GET, POST, DELETE }

class BaseServices {
  static BaseServices instance = BaseServices();

  // Client _client;
  // Map<String, dynamic> _headersParam;

  Future<Response> request(String url, RequestType requestType,
      {dynamic data}) async {
    Response response;
    try {
      switch (requestType) {
        case RequestType.GET:
          response = await get(url);
          break;
        case RequestType.POST:
          response = await post(
            url,
            body: data,
          );
          break;
        case RequestType.DELETE:
          response = await delete(url);
          break;
      }
    } on HttpException catch (e) {
      print(e.message);
      print(e.toString());
      print(e.uri);
      response = jsonDecode(e.message);
    }

    // response = jsonDecode(response.body);

    if (response.statusCode == 404) {
      print(jsonDecode(response.body)['status_code']);
      print(jsonDecode(response.body)['status_message']);
      throw ClientException(response.body);
    }
    return response;
  }
}
