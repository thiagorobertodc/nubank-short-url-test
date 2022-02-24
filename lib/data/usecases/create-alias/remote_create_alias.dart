import '../../http/http.dart';
import '../../models/models.dart';
import '/../domain/entities/entities.dart';
import '/../domain/helpers/helpers.dart';
import '/../domain/usecases/usecases.dart';

class RemoteCreateAlias implements CreateUrlAlias {
  final HttpClient httpClient;
  final String url;

  RemoteCreateAlias({required this.httpClient, required this.url});
  Future<AliasEntity?> create(CreateAliasParams urlParams) async {
    try {
      final body = RemoteCreateAliasParams.fromDomain(urlParams).toJson();
      final httpResponse = await httpClient.request(
        url: url,
        method: 'post',
        body: body
      );
      return RemoteAliasModel.fromJson(httpResponse as Map).toEntity();
    } on HttpError catch (error) {
      throw error == HttpError.notFound
          ? DomainError.notFound
          : DomainError.unexpected;
    }
  }
}


class RemoteCreateAliasParams {
  final String url;

  RemoteCreateAliasParams({
    required this.url
  });

  factory RemoteCreateAliasParams.fromDomain(CreateAliasParams params) =>
      RemoteCreateAliasParams(
        url: params.url
      );

  Map toJson() => {
        "url": url
      };
}