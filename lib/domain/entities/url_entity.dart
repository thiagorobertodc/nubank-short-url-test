import 'package:equatable/equatable.dart';


class UrlEntity extends Equatable {

  final String url;
  @override
  List get props =>
      [url];

  const UrlEntity(
    this.url
  );
}
