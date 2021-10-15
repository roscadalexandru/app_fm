import '../app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'error_handler.dart';

class ErrorListener extends StatelessWidget {
  const ErrorListener({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ErrorHandlerCubit, ErrorHandlerState>(
      listener: (context, state) {
        switch (state.status) {
          /*           
            * There's a bug which causes the listener to trigger twice
            * and show two snackbar, one after the other
            * clearSnackBars() is used as a workaround to not show
            * the second snackbar
          */
          case ErrorHandlerStatus.hide:
            ScaffoldMessenger.of(context).clearSnackBars();
            break;
          case ErrorHandlerStatus.show:
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errorMessage!),
              backgroundColor: Colors.red,
            ));
            break;
        }
      },
      child: child,
    );
  }
}
