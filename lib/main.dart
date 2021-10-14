import 'dart:developer';

import 'package:app_fm/error_handler/error_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    log('${bloc.runtimeType}, event: $event');
    log('-' * 100);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log('${bloc.runtimeType}, transition: $transition');
    log('-' * 100);
    super.onTransition(bloc, transition);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log('${bloc.runtimeType}, change: $change ');
    log('-' * 100);

    super.onChange(bloc, change);
  }
}

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(BlocProvider(
    create: (context) => ErrorHandlerCubit(),
    child: const App(),
  ));
}
