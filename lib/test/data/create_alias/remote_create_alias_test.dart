import 'package:faker/faker.dart';
import 'package:nubanktest/data/http/http.dart';
import 'package:nubanktest/data/usecases/usecases.dart';
import 'package:nubanktest/domain/helpers/helpers.dart';
import 'package:nubanktest/domain/usecases/usecases.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  late RemoteCreateAlias sut;
  late HttpClientSpy httpClient;
  late CreateAliasParams params;
  late String url;

  When mockRequest() => when(
        () => httpClient.request(
          url: any(named: 'url', that: isNotNull),
          method: any(named: 'method', that: isNotNull),
          body: any(named: 'body'),
        ),
      );

  void mockHttpError(HttpError error) {
    mockRequest().thenThrow(error);
  }

  void mockHttpData(Map data) {
    mockRequest().thenAnswer((_) async => data);
  }

 Map<dynamic, dynamic> fakeAnswer = {'self': '0', 'short': '1',};

  Map mockValidData() =>
      {'alias': faker.internet.httpUrl().toString(), '_links': fakeAnswer};

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    sut = RemoteCreateAlias(httpClient: httpClient, url: url);
    params = CreateAliasParams(
      url: faker.internet.httpUrl()
    );
    mockHttpData(mockValidData());
  });
  test('Should call HttpClient with correct values', () async {
    await sut.create(params); // ACT

    verify(() => httpClient.request(url: url, method: 'post', body: {
          "url": params.url
        }));
  });

  test('Should throw UnexpectedError if HttpClient returns 400', () async {
    mockHttpError(HttpError.badRequest);
    final future = sut.create(params); // ACT

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient returns 404', () async {
    mockHttpError(HttpError.notFound);
    final future = sut.create(params); // ACT

    expect(future, throwsA(DomainError.notFound));
  });

  test('Should throw UnexpectedError if HttpClient returns 500', () async {
    mockHttpError(HttpError.serverError);
    final future = sut.create(params); // ACT

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw InvalidCredentialsError if HttpClient returns 403',
      () async {
    mockHttpError(HttpError.forbidden);
    final future = sut.create(params); // ACT

    expect(future, throwsA(DomainError.unexpected));
  });

  test(
      'Should throw UnexpectedError if HttpClient returns 200 with invalid data',
      () async {
    mockHttpData({'invalid_key': 'invalid_value'});

    final future = sut.create(params); // ACT

    expect(future, throwsA(DomainError.unexpected));
  });
}
