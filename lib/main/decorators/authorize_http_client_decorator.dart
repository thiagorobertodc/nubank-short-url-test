import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

import '../../data/http/http.dart';

class AuthorizeHttpClientDecorator implements HttpClient {
  final HttpClient decoratee;

  AuthorizeHttpClientDecorator({
    required this.decoratee,
  });

  Future<dynamic> request({
    required String url,
    required String method,
    Map? body,
    Map? headers,
  }) async {
    try {
    final bool isMultipartRequest =
          headers != null && headers.containsValue('multipart/form-data');
      final Map authorizedHeaders;
      if (isMultipartRequest && body!['photo'] != null && body['photo'] != '') {
        final Map<String, String> jsonBody = Map<String, String>.from(body);
        String file = '';
        if (jsonBody.containsKey('photo')) {
          file = (jsonBody['photo'] ?? '').toString();
          jsonBody.remove('photo');
        }
        final MultipartRequest request =
            MultipartRequest(method, Uri.parse(url))
              ..fields.addAll(jsonBody)
              ..files.add(MultipartFile.fromBytes(
                  'photo', await File(file).readAsBytes(),
                  filename: 'photo', contentType: MediaType('image', 'jpeg')));
        final futureResponse = await request.send();
        return json.decode(await futureResponse.stream.bytesToString());
      } else {
        final response = await decoratee.request(
            url: url, method: method, body: body);
        return response;
      }
    } catch (error) {
      if (error is HttpError &&
          error != HttpError.forbidden &&
          error != HttpError.unauthorized) {
        rethrow;
      } else {
        throw HttpError.forbidden;
      }
    }
  }
}
