import '../../domain/entities/entities.dart';

import '../http/http.dart';

import './models.dart';

class RemoteLinkModel {
  final String self;
  final String short;

  RemoteLinkModel(
    this.self,
    this.short
  );

  factory RemoteLinkModel.fromJson(Map json) {
    if (!json.keys.toSet().containsAll([
      'self',
      'short'
    ])) {
      throw HttpError.invalidData;
    }
    return RemoteLinkModel(
      json['self'] as String,
     json['short'] as String,
    );
  }

  LinkEntity toEntity() => LinkEntity(self, short);

  Json toJson() => {
        'self': self,
        'short': short
      };
}
