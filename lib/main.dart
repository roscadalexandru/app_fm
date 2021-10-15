import 'error_handler/error_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'app_bloc_observer.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(BlocProvider(
    create: (context) => ErrorHandlerCubit(),
    child: const App(),
  ));
}
