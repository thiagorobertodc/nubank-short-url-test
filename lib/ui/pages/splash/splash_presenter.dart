abstract class SplashPresenter {
  Stream<String?> get navigateToStream;
  Future<void> splashPresent({int? durationInSeconds});
}
