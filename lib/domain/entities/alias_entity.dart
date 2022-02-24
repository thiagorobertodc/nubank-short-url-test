import 'package:equatable/equatable.dart';

import './entities.dart';


class AliasEntity extends Equatable {

  final String alias;
  final LinkEntity link;
  @override
  List get props =>
      [alias, link];

  const AliasEntity(
    this.alias,
    this.link
  );
}
