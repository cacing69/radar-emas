sealed class Result<T> {
  const Result();

  factory Result.success(T data) = Success<T>;
  factory Result.failure(String message) = Failure<T>;

  R fold<R>({required R Function(T data) onSuccess, required R Function(String message) onFailure}) {
    return switch (this) {
      Success(:final data) => onSuccess(data),
      Failure(:final message) => onFailure(message),
    };
  }
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends Result<T> {
  final String message;
  const Failure(this.message);
}
