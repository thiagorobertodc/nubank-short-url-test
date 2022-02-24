import '../../http/http.dart';
import '../../models/models.dart';
import '/../domain/entities/entities.dart';
import '/../domain/helpers/helpers.dart';
import '/../domain/usecases/usecases.dart';

class RemoteFetchLink implements FetchLink {
  final HttpClient httpClient;
  final String url;

  RemoteFetchLink({required this.httpClient, required this.url});
 Future<UrlEntity?> get() async {
    try {
      final httpResponse = await httpClient.request(
        url: url,
        method: 'post',
      );
      return RemoteUrlModel.fromJson(httpResponse as Map).toEntity();
    } on HttpError catch (error) {
      throw error == HttpError.notFound
          ? DomainError.notFound
          : DomainError.unexpected;
    }
  }
}
