import '../entities/entities.dart';

abstract class FetchLink {
  Future<UrlEntity?> get();
}
