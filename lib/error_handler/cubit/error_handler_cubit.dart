import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'error_handler_state.dart';

class ErrorHandlerCubit extends Cubit<ErrorHandlerState> {
  ErrorHandlerCubit() : super(ErrorHandlerState.init());

  displayError(String errorMessage) {
    emit(state.error(errorMessage));
    // emit(state.hideError());
    Future.delayed(const Duration(seconds: 3), () {
      emit(state.hideError());
    });
  }
}
