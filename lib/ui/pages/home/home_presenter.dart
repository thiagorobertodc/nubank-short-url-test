import '../../../../domain/entities/entities.dart';

abstract class HomePresenter {
  Stream<AliasEntity?> get alias;
  Future<void> shortUrl(String url);
  List<LinkEntity>? lastShorttenUrls;
}
