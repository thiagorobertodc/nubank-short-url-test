import 'package:get/get.dart';

import '../../ui/pages/pages.dart';

class GetxSplashPresenter implements SplashPresenter {
  final _navigateTo = Rx<String?>(null);
  Stream<String?> get navigateToStream => _navigateTo.stream;
  
  Future<void> splashPresent({int? durationInSeconds = 4}) async {
    await Future.delayed(Duration(seconds: durationInSeconds!));
    _navigateTo.value = '/home';
  }
}
