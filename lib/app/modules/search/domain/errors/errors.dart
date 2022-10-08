abstract class FailureSearch implements Exception {}

class InvalidTextError implements FailureSearch {
  final String message;

  InvalidTextError(this.message);
}
