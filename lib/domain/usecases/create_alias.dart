import 'package:equatable/equatable.dart';

import '../entities/entities.dart';

abstract class CreateUrlAlias {
  Future<AliasEntity?> create(CreateAliasParams urlParams);
}

class CreateAliasParams extends Equatable {
  final String url;
  @override
  List get props => [
      url
      ];

  const CreateAliasParams({
    required this.url
  });
}