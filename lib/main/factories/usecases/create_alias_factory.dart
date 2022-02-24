import '../../../data/usecases/usecases.dart';
import '../../../domain/usecases/usecases.dart';
import '../factories.dart';

CreateUrlAlias makeCreateAlias() {

  return RemoteCreateAlias(
    httpClient: makeHttpAdapter(),
    url: makeApiUrl('api/alias'),
  );
}
