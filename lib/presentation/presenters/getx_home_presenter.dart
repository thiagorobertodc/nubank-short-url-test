import 'package:get/get.dart';

import '../../domain/usecases/usecases.dart';
import '../../domain/entities/entities.dart';
import '../../ui/pages/pages.dart';

class GetxHomePresenter extends GetxController implements HomePresenter {
  CreateUrlAlias createAlias;

  GetxHomePresenter({required this.createAlias});

  final _alias = Rx<AliasEntity?>(null);

  @override
  List<LinkEntity>? lastShorttenUrls = [];

  @override
  Stream<AliasEntity?> get alias => _alias.stream;

  @override
  Future<void> shortUrl(String url) async {
    final alias = await createAlias.create(CreateAliasParams(url: url));
    _alias.subject.add(alias);
    lastShorttenUrls!.add(alias!.link);
  }
}
