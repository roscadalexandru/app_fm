part of 'error_handler_cubit.dart';

enum ErrorHandlerStatus { hide, show }

class ErrorHandlerState extends Equatable {
  const ErrorHandlerState({required this.status, this.errorMessage});

  factory ErrorHandlerState.init() =>
      const ErrorHandlerState(status: ErrorHandlerStatus.hide);

  final ErrorHandlerStatus status;
  final String? errorMessage;

  ErrorHandlerState error(String errorMessage) => ErrorHandlerState(
      status: ErrorHandlerStatus.show, errorMessage: errorMessage);

  ErrorHandlerState hideError() => ErrorHandlerState.init();

  @override
  List<Object?> get props => [status, errorMessage];
}
