import '../../domain/entities/entities.dart';

import '../http/http.dart';

import './models.dart';

class RemoteAliasModel {
  final String alias;
  final RemoteLinkModel link;

  RemoteAliasModel(
    this.alias,
    this.link
  );

  factory RemoteAliasModel.fromJson(Map json) {
    if (!json.keys.toSet().containsAll([
      'alias',
      '_links'
    ])) {
      throw HttpError.invalidData;
    }
    return RemoteAliasModel(
      json['alias'] as String,
     RemoteLinkModel.fromJson(json['_links'] as Map),
    );
  }

  AliasEntity toEntity() => AliasEntity(alias, link.toEntity());

  Json toJson() => {
        'alias': alias,
        '_links': link
      };
}
