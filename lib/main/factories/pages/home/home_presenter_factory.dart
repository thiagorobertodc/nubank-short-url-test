import '../../../../../presentation/presenters/presenters.dart';
import '../../../../../ui/pages/pages.dart';
import '../../factories.dart';

HomePresenter makeGetxHomePresenter() {
  return GetxHomePresenter(createAlias: makeCreateAlias());
}
