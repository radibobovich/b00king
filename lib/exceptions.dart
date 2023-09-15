class NotFoundException implements Exception {
  final String message;

  NotFoundException(this.message);
}

class ServerException implements Exception {
  final String message;

  ServerException(this.message);
}
