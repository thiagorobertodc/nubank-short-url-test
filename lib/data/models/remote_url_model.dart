import '../../domain/entities/entities.dart';

import '../http/http.dart';

import './models.dart';

class RemoteUrlModel {
  final String url;

  RemoteUrlModel(
    this.url
  );

  factory RemoteUrlModel.fromJson(Map json) {
    if (!json.keys.toSet().containsAll([
      'url',
    ])) {
      throw HttpError.invalidData;
    }
    return RemoteUrlModel(
      json['url'] as String,
    );
  }

  UrlEntity toEntity() => UrlEntity(url);

  Json toJson() => {
        'url': url,
      };
}
