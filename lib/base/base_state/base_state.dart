import 'package:news_app/result.dart';

sealed class BaseState<T> {}

class SuccessState<T> extends BaseState<T> {
  T data;

  SuccessState({
    required this.data,
  });
}

class ErrorState<T> extends BaseState<T> {
  ServerError? serverError;
  Error? error;

  ErrorState({
    this.error,
    this.serverError,
  });
}

class LoadingState<T> extends BaseState<T> {
  String? loadingMessage;

  LoadingState({
    this.loadingMessage,
  });
}
