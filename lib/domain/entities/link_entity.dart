import 'package:equatable/equatable.dart';


class LinkEntity extends Equatable {

  final String self;
  final String short;
  @override
  List get props =>
      [self, short];

  const LinkEntity(
    this.self,
    this.short
  );
}
