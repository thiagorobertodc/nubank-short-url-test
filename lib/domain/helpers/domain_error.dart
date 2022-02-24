enum DomainError { unexpected, invalidUrl, notFound }

extension DomainErrorExtension on DomainError {
  String get description {
    switch (this) {
      case DomainError.invalidUrl:
        return 'Invalid URL.';
      case DomainError.notFound:
        return 'Link not found.';
      default:
        return 'Something went wrong. Try again later.';
    }
  }
}
